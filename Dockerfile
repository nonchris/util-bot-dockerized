ARG ARCH=
FROM ${ARCH}ubuntu:20.10

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt upgrade -y && \
    apt install -y \
    git \
    openjdk-15-jdk-headless \
    maven

VOLUME /app
WORKDIR /app

RUN git clone https://github.com/n1ck-i/util-bot.git .
RUN git checkout d081970

CMD cp /application.properties /app/src/main/resources/application.properties && \
    mvn clean package -e && \
    java -jar target/util-bot-0.1.jar
