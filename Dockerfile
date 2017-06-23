FROM resin/rpi-raspbian:jessie
MAINTAINER Thibault

RUN apt-get update && apt-get install -y \
    git-core \
    build-essential \
    gcc

RUN git clone git://git.drogon.net/wiringPi
RUN cd wiringPi && ./build

RUN cd

COPY . /
WORKDIR /
RUN gcc -o main main.c -lwiringPi
CMD ["./main"]