FROM ubuntu:14.04
MAINTAINER Dimitri Koussa "dimitri.koussa@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --yes
RUN apt-get install --yes software-properties-common
RUN apt-add-repository ppa:webupd8team/java --yes
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update --yes
RUN apt-get install --yes oracle-java8-installer
RUN apt-get remove --yes software-properties-common
RUN apt-get autoremove --yes
RUN apt-get clean --yes
RUN rm --force --recursive /var/cache/oracle-jdk8-installer
RUN rm --force /usr/lib/jvm/java-8-oracle/src.zip
ENV DEBIAN_FRONTEND newt
