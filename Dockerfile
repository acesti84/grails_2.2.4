FROM ubuntu:bionic
ENV DEBIAN_FRONTEND noninteractive
USER root

RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main universe" >> /etc/sources.list
RUN add-apt-repository ppa:openjdk-r/ppa  
RUN apt-get update
RUN apt-get --fix-missing update

# add packages
RUN apt-get -y install apt-utils 
RUN apt-get -y install wget
RUN apt-get -y install openssl
RUN apt-get -y install curl 
RUN apt-get -y install zip
RUN apt-get -y install unzip

# install java 7
RUN apt-get -y install openjdk-7-jdk

# get skdman
RUN /bin/bash
RUN curl -s https://get.sdkman.io | bash

# install grails
RUN /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh" 
RUN /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install grails 2.2.4" 

RUN apt-get clean
RUN apt-get autoclean
RUN apt-get autoremove
 
CMD ["tail -f /dev/null"]
