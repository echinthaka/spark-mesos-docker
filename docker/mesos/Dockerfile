# Version 0.1.0_0.23.1
# Based off of https://github.com/mesosphere/docker-containers/blob/5661f7/mesos/dockerfile-templates/mesos.
# The tagging scheme is <Dockerfile version>_<Mesos version>.
#
# Changelog
# 0.1.0  Initial version.
FROM ubuntu:14.04

ENV MESOS_VERSION=0.23.1-0.2.61

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get -y update && \
  apt-get -y install --no-install-recommends mesos=${MESOS_VERSION}.ubuntu1404 && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
