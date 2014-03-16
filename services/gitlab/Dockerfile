FROM aostanin/debian

RUN apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate
RUN apt-get install -y python2.7 python-docutils git-core sudo libmysqlclient-dev nginx mysql-client

ADD http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.bz2 /tmp/ruby.tar.bz2
RUN cd /tmp && \
    tar xjvf ruby.tar.bz2 && \
    cd ruby-2.0.0-p353 && \
    ./configure --disable-install-rdoc && \
    make && \
    make install && \
    cd && \
    rm -rf /tmp/ruby-2.0.0-p353
RUN gem install bundler --no-ri --no-rdoc

RUN adduser --disabled-login --gecos 'GitLab' git

RUN cd /home/git && \
    sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-shell.git -b v1.8.0

RUN cd /home/git && \
    sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-ce.git -b 6-6-stable gitlab && \
    cd gitlab && \
    chown -R git log tmp && \
    sudo -u git -H mkdir /home/git/gitlab-satellites tmp/pids tmp/sockets public/uploads && \
    chmod -R u+rwX log tmp public/uploads && \
    sudo -u git -H cp config/unicorn.rb.example config/unicorn.rb && \
    sudo -u git -H cp config/initializers/rack_attack.rb.example config/initializers/rack_attack.rb && \
    sudo -u git -H git config --global user.name "GitLab" && \
    sudo -u git -H git config --global user.email "gitlab@localhost" && \
    sudo -u git -H git config --global core.autocrlf input && \
    cp lib/support/init.d/gitlab /etc/init.d/gitlab && \
    cp lib/support/init.d/gitlab.default.example /etc/default/gitlab && \
    cp lib/support/nginx/gitlab /etc/nginx/sites-available/default

RUN cd /home/git/gitlab && \
    sudo -u git -H bundle install --deployment --without development test postgres aws

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/repositories"]
EXPOSE 80
EXPOSE 22

WORKDIR /home/git/gitlab
CMD ["/start.sh"]
