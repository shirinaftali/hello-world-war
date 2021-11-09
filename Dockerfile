FROM ubuntu:20.04
MAINTAINER Shiri
RUN apt-get update
COPY *.war /warFile/.war