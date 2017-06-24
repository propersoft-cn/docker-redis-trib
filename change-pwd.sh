#!/bin/bash

REDIS_BASE=`gem list -d redis|grep Install|awk -F ': ' '{print $2}'`
REDIS_VER=`gem list -d redis|grep 'redis '|cut -f2 -d '('|cut -f1 -d ')'`
REDIS_HOME=$REDIS_BASE/gems/redis-$REDIS_VER/lib/redis

sed -i "s/:password => .*/:password => \"$REDIS_CLUSTER_PWD\",/" $REDIS_HOME/client.rb