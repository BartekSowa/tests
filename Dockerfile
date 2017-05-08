FROM ubuntu:16.04 
MAINTAINER bartosz.sowa@comarch.com 
RUN dpkg --add-architecture i386
RUN apt-get update  && apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
RUN apt-get install -y wget expect unzip libz1:i386 libncurses5:i386 libbz2-1.0:i386 libstdc++6:i386 software-properties-common
ENV LANG en_US.UTF-8 
RUN locale-gen $LANG

RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/ 
RUN export JAVA_HOME
RUN mkdir -p /android-sdk
RUN if [ ! -d tools ]; then wget -nv -P /android-sdk/ "https://dl.google.com/android/repository/tools_r25.2.3-linux.zip"; unzip /android-sdk/tools_r25.2.3-linux.zip -d /android-sdk; fi
ENV ANDROID_HOME /android-sdk 
RUN export ANDROID_HOME

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools RUN export PATH
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android-sdk/tools/android update sdk -a -u -s --filter tools
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android-sdk/tools/android update sdk -a -u -s --filter platform-tools
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android-sdk/tools/android update sdk -a -u -s --filter extra-android-support
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android-sdk/tools/android update sdk -a -u -s --filter extra-android-m2repository
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android-sdk/tools/android update sdk -a -u -s --filter extra-google-m2repository
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android-sdk/tools/android update sdk -a -u -s --filter extra-google-google_play_services
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android-sdk/tools/android update sdk -a -u -s --filter android-25,android-24,android-23,android-22,android-21,android-20,android-19,android-18,android-17,android-16,android-15,android-14,android-13,android-12,android-11,android-10,android-9,android-8,android-7,android-6,android-5,android-4,android-3,android-2
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /android-sdk/tools/android update sdk -a -u -s --filter  build-tools-25.0.2,build-tools-25.0.1,build-tools-25.0.0,build-tools-24.0.3,build-tools-24.0.2,build-tools-24.0.1,build-tools-24.0.0,build-tools-23.0.3,build-tools-23.0.2,build-tools-23.0.1,build-tools-23.0.0,build-tools-22.0.1,build-tools-22.0.0,build-tools-21.1.2,build-tools-21.1.1,build-tools-21.1.0,build-tools-21.0.2,build-tools-21.0.1,build-tools-21.0.0,build-tools-20.0.0,build-tools-19.1.0,build-tools-19.0.3,build-tools-19.0.2,build-tools-19.0.1,build-tools-19.0.0,build-tools-18.1.1,build-tools-18.1.0,build-tools-18.0.1,build-tools-17.0.0
