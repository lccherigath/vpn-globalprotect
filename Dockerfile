FROM ubuntu:19.10
RUN apt-get -y update && apt-get -y install ssh openconnect iputils-ping
