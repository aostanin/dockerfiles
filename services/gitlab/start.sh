#! /bin/sh

set -e

GITLAB_HOST=${GITLAB_HOST:-localhost}
GITLAB_EMAIL=${GITLAB_EMAIL:-gitlab@${GITLAB_HOST}}
SUPPORT_EMAIL=${SUPPORT_EMAIL:-support@${GITLAB_HOST}}
UNICORN_WORKERS=${UNICORN_WORKERS:-1}
DB_HOST=$DB_PORT_3306_TCP_ADDR
DB_PORT=$DB_PORT_3306_TCP_PORT
DB_DATABASE=${DB_DATABASE:-gitlab}
DB_USERNAME=${DB_USERNAME:-gitlab}
DB_PASSWORD=${DB_PASSWORD:-}

mkdir -p /data/git /data/gitlab/initializers /data/gitlab-shell

# SSH config
if [ ! -d /etc/ssh.default ]; then
  mv /etc/ssh /etc/ssh.default
fi
if [ ! -d /data/ssh ]; then
  cp -r /etc/ssh.default /data/ssh
fi
ln -snf /data/ssh /etc/ssh

# Git user's authorized_keys
touch /data/git/authorized_keys
sudo -u git -H mkdir -p /home/git/.ssh
ln -sf /data/git/authorized_keys /home/git/.ssh/authorized_keys

# Gitlab-Shell config
if [ ! -f /data/gitlab-shell/config.yml ]; then
  cp /home/git/gitlab-shell/config.yml.example /data/gitlab-shell/config.yml
fi
ln -sf /data/gitlab-shell/config.yml /home/git/gitlab-shell/config.yml
sed -i "s/^\(gitlab_url:\s*\"\)[^\"]*/\1http:\/\/127.0.0.1\//" /data/gitlab-shell/config.yml
sed -i "s/^\(repos_path:\s*\"\)[^\"]*/\1\/repositories/" /data/gitlab-shell/config.yml

# Gitlab config
if [ ! -f /data/gitlab/gitlab.yml ]; then
  cp /home/git/gitlab/config/gitlab.yml.example /data/gitlab/gitlab.yml
fi
ln -sf /data/gitlab/gitlab.yml /home/git/gitlab/config/gitlab.yml
sed -i "s/^\(\s*host:\s*\).*$/\1${GITLAB_HOST}/" /data/gitlab/gitlab.yml
sed -i "s/^\(\s*email_from:\s*\).*$/\1${GITLAB_EMAIL}/" /data/gitlab/gitlab.yml
sed -i "s/^\(\s*support_email:\s*\).*$/\1${SUPPORT_EMAIL}/" /data/gitlab/gitlab.yml
sed -i "s/^\(\s*repos_path:\s*\).*$/\1\/repositories\//" /data/gitlab/gitlab.yml

# SMTP Settings Initializer
if [ ! -f /data/gitlab/initializers/smtp_settings.rb ]; then
  cp /home/git/gitlab/config/initializers/smtp_settings.rb.sample /data/gitlab/initializers/smtp_settings.rb
fi
ln -sf /data/gitlab/initializers/smtp_settings.rb /home/git/gitlab/config/initializers/smtp_settings.rb

# Unicorn config
if [ ! -f /data/gitlab/unicorn.rb ]; then
  cp /home/git/gitlab/config/unicorn.rb.example /data/gitlab/unicorn.rb
fi
ln -sf /data/gitlab/unicorn.rb /home/git/gitlab/config/unicorn.rb
sed -i "s/^\(worker_processes\s*\)[0-9]*/\1${UNICORN_WORKERS}/" /data/gitlab/unicorn.rb

# Generate database config
cat > /data/gitlab/database.yml <<EOF
production:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: ${DB_DATABASE}
  pool: 10
  username: ${DB_USERNAME}
  password: "${DB_PASSWORD}"
  host: ${DB_HOST}
  port: ${DB_PORT}
EOF
ln -sf /data/gitlab/database.yml /home/git/gitlab/config/database.yml

# Set Gitlab user email address
sudo -u git -H git config --global user.email "${GITLAB_EMAIL}"

# Fix permissions
chown -R git:git /data /repositories

# Run Gitlab-Shell install
sudo -u git -H /home/git/gitlab-shell/bin/install

# Start sshd
mkdir -p /var/run/sshd
/usr/sbin/sshd -D &

# Start other services
service redis-server start
service nginx start
service gitlab start

# Count the number of tables in the database
GITLAB_TABLE_COUNT=$(mysql --user=${DB_USERNAME} --password=${DB_PASSWORD} --host=${DB_PORT_3306_TCP_ADDR} --port=${DB_PORT_3306_TCP_PORT} --skip-column-names --batch --execute="SELECT COUNT(DISTINCT table_name) FROM information_schema.columns WHERE table_schema = '${DB_DATABASE}'")

# Run initial database setup if the database is empty
if [ $GITLAB_TABLE_COUNT -eq 0 ]; then
  echo yes | sudo -u git -H bundle exec rake gitlab:setup RAILS_ENV=production
fi

# Migrate database / setup assets
sudo -u git -H bundle exec rake db:migrate RAILS_ENV=production
sudo -u git -H bundle exec rake assets:precompile cache:clear RAILS_ENV=production

# Recreate Gitlab Satellites
sudo -u git -H bundle exec rake gitlab:satellites:create RAILS_ENV=production

# Print diagnostics
sudo -u git -H bundle exec rake gitlab:env:info RAILS_ENV=production
sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production

tail -f /home/git/gitlab/log/*.log
