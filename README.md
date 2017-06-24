docker-redis-trib
=================

Change redis client's default password to `REDIS_CLUSTER_PWD` environment variable in Dockerfile, to make redis-trib.rb can connect to redis cluster with password protected.

1. Modify `REDIS_CLUSTER_PWD` in [Dockerfile](./Dockerfile)
1. `docker build -t propersoft/docker-redis-trib .`
1. `docker run --rm -it propersoft/docker-redis-trib create --replicas 1 192.168.1.1:6379 192.168.1.1:6380 192.168.1.2:6379 192.168.1.2:6380 192.168.1.3:6379 192.168.1.3:6380`
