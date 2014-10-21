#!/bin/bash

if [[ -z "$CASSANDRA_HOST_LIST" ]]; then
    export CASSANDRA_HOST_LIST=10.1.2.3:9160
fi
#if [[ -z "$KAIROS_JETTY_PORT" ]]; then
#    export KAIROS_JETTY_PORT=8083
#fi

#sed -i "s/^kairosdb.jetty.port.*$/kairosdb.jetty.port=$KAIROS_JETTY_PORT/" /opt/kairosdb/conf/kairosdb.properties
sed -i "s/^kairosdb.datastore.cassandra.host_list.*$/kairosdb.datastore.cassandra.host_list=$CASSANDRA_HOST_LIST/" /opt/kairosdb/conf/kairosdb.properties

/opt/kairosdb/bin/kairosdb.sh run
