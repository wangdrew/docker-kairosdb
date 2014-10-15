FROM ngty/archlinux-jdk7
MAINTAINER wangdrew

# Install KAIROSDB
RUN cd /opt; \
  curl -L http://dl.bintray.com:80/brianhks/generic/kairosdb-0.9.3.tar.gz | \
  tar zxfp -

ADD kairosdb.properties /opt/kairosdb/conf/kairosdb.properties
EXPOSE 4242 8080

# Run kairosdb in foreground on boot
ENTRYPOINT ["/opt/kairosdb/bin/kairosdb.sh", "run"]
