#! /bin/sh

set -e

[ ! -d /data/conf ] && cp -r /usr/local/crashplan/conf.default /data/conf

cd /usr/local/crashplan
nice -n 19 /usr/bin/java -Dfile.encoding=UTF-8 -Dapp=CrashPlanService -DappBaseName=CrashPlan -Xms20m -Xmx1024m -Djava.net.preferIPv4Stack=true -Dsun.net.inetaddr.ttl=300 -Dnetworkaddress.cache.ttl=300 -Dsun.net.inetaddr.negative.ttl=0 -Dnetworkaddress.cache.negative.ttl=0 -Dc42.native.md5.enabled=false -classpath /usr/local/crashplan/lib/com.backup42.desktop.jar:/usr/local/crashplan/lang com.backup42.service.CPService
