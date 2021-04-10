ARG ARCH=
FROM ${ARCH}ubuntu:20.10

VOLUME /app
WORKDIR /app

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt upgrade -y && \
    apt install -y \
    git \
    openjdk-15-jdk-headless \
    maven && \
    git clone https://github.com/n1ck-i/util-bot.git . && \
    git checkout d081970
    git clone https://github.com/nonchris/util-bot.git /app && \
    cd /app && \
    git checkout 7cd8209

CMD cp /application.properties /app/src/main/resources/application.properties && \
    mvn clean package -e && \
    java -jar target/util-bot-0.1.jar
