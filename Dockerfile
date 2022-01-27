# irssi and OpenVPN
#
# Version 1.0

FROM ubuntu:latest
MAINTAINER Jonathan Shreckengost

VOLUME /openvpn-config

ENV DEBIAN_FRONTEND noninteractive

ENV TZ=America/New_York

# Prevents being prompted for timezone during package install
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
	&& echo $TZ > /etc/timezone

RUN usermod -u 99 nobody

RUN apt-get update \
	&& apt-get install -y --no-install-recommends irssi apt-utils openssl openvpn \
	&& apt-get install -y software-properties-common moreutils curl net-tools iptables ipcalc dos2unix unrar \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD openvpn/ /etc/openvpn/

RUN chmod +x /etc/openvpn/*.sh

CMD ["/bin/bash", "/etc/openvpn/start.sh", "irssi"]
