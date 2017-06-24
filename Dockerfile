FROM redis

MAINTAINER Alpha Hinex <AlphaHinex@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y --no-install-recommends install ruby \
  && gem install redis \
  && apt-get -y autoremove \
  && apt-get -y clean

# Change pwd as will
ENV REDIS_CLUSTER_PWD pwd123 

ADD change-pwd.sh /usr/local/bin/change-pwd.sh
RUN chmod 755 /usr/local/bin/change-pwd.sh
RUN /usr/local/bin/change-pwd.sh
ADD redis-trib.rb /usr/local/bin/redis-trib.rb
RUN chmod 755 /usr/local/bin/redis-trib.rb

ENTRYPOINT ["/usr/local/bin/redis-trib.rb"]
