FROM debian:buster-slim

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y -o Dpkg::Options::="--force-confold" --no-install-recommends --no-install-suggests -y netcat libcap2-bin

RUN setcap CAP_NET_BIND_SERVICE=+eip /bin/nc.traditional
