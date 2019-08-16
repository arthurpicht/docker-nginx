FROM nginx

ENV DOCKER_NAME="nginx"
ENV LANG C.UTF-8

RUN set -uex; \
	export DEBIAN_FRONTEND=noninteractive; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		apt-utils; \
	apt-get -y upgrade; \
	apt-get install -y --no-install-recommends \
		iputils-ping \
		procps \
		wget \
		tar \
		less \
		ca-certificates p11-kit; \
	rm -rf /var/lib/apt/lists/*; \
	echo "PS1='\[\033[01;33m\][\$DOCKER_NAME]\[\033[01;31m\]\u@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc; \
	echo "alias ls='ls --color=auto'" >> /root/.bashrc; \
	echo "alias l='ls -CF'" >> /root/.bashrc; \
	echo "alias ll='ls -lhF'" >> /root/.bashrc; \
	echo "alias lll='ls -lahF'" >> /root/.bashrc; \
	echo "alias la='ls -A'" >> /root/.bashrc; \
	mkdir /etc/nginx/certs

# see also:
# https://github.com/nginxinc/docker-nginx/blob/master/stable/buster/Dockerfile
