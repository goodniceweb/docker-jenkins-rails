FROM jenkins:1.596.2
MAINTAINER Alex Cherkashin <goodniceweb@gmail.com>

# install recent packages
USER root
RUN apt-get update
RUN apt-get upgrade -y

# install rails dependencies
RUN apt-get install -y wget \
 apt-transport-https \
 autoconf \
 automake \
 bc \
 bison \
 build-essential \
 gawk \
 git-core \
 pkg-config \
 libcurl4-openssl-dev \
 libgdbm-dev \
 libffi-dev \
 libncurses5-dev \
 libreadline6-dev \
 libssl-dev \
 libsqlite3-dev \
 libtool \
 libyaml-dev \
 libxml2 \
 libxml2-dev \
 links \
 nodejs \
 nodejs-legacy \
 npm \
 openssl \
 rsync \
 sqlite3 \
 zlib1g-dev

USER jenkins

RUN echo 'gem: --no-ri --no-rdoc' > /usr/share/jenkins/ref/.gemrc

# Rails specific plugins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
