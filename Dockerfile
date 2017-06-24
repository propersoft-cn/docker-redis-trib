FROM redis
MAINTAINER Alpha Hinex <AlphaHinex@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y --no-install-recommends install ruby \
  && gem install redis \
  && apt-get -y autoremove \
  && apt-get -y clean

ENV REDIS_CLUSTER_PWD nil 

ADD change-pwd.sh /usr/local/bin/change-pwd.sh
RUN chmod 755 /usr/local/bin/change-pwd.sh
ADD redis-trib.rb /usr/local/bin/redis-trib.rb
RUN chmod 755 /usr/local/bin/redis-trib.rb

ENTRYPOINT ["/usr/local/bin/change-pwd.sh", "/usr/local/bin/redis-trib.rb"]
