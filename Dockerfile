FROM ubuntu:latest
MAINTAINER Itobuztech  <prosenjit@itobuz.com>

RUN apt-get update
RUN apt-get dist-upgrade -y

## Install curl
RUN apt-get -y install curl

## Install node js and git
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - \
    && apt-get install -y nodejs && \
    apt-get install -y git wget unzip python build-essential



## Install JRE
RUN apt-get install -y default-jre
RUN apt-get install -y default-jdk

# Install imagemagic
RUN apt-get install -y imagemagick

## Install postgresql
RUN apt-get install -y postgresql-client
RUN apt-get install -y postgresql postgresql-contrib

# config
# RUN cp ./install/pg_hba.conf /etc/postgresql/9.5/main

# start daemon
#RUN /etc/init.d/postgresql restart

# Install elasticsearch
RUN curl -L -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.1.zip
RUN unzip elasticsearch-1.7.1.zip
RUN rm elasticsearch-1.7.1.zip
RUN ./elasticsearch-1.7.1/bin/elasticsearch -d

# Install redis server
RUN apt-get install -y redis-server

# install node modules
RUN npm install gulp -g
RUN npm install  bower -g
RUN npm install forever -g
RUN npm install node-inspector -g
