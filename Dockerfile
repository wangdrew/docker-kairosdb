FROM ngty/archlinux-jdk7
MAINTAINER wangdrew

# Install KAIROSDB
RUN cd /opt; \
  curl -L http://dl.bintray.com:80/brianhks/generic/kairosdb-0.9.3.tar.gz | \
  tar zxfp -

ADD kairosdb.properties /opt/kairosdb/conf/kairosdb.properties

# Kairos API telnet and jetty ports
EXPOSE 4242 8083

# Set Kairos config vars
#ENV KAIROS_JETTY_PORT 8083
ENV CASSANDRA_HOST_LIST 10.1.2.3:9160

# Copy scripts into container to set kairos config params
ADD config-kairos.sh /usr/bin/config-kairos.sh

# Run kairosdb in foreground on boot
CMD ["/usr/bin/config-kairos.sh"]
