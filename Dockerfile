ARG ARCH=
FROM ${ARCH}ubuntu:20.10

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    git \
    openjdk-15-jdk-headless \
    maven && \
    git clone https://github.com/nonchris/util-bot.git /app && \
    cd /app && \
    git checkout 7cd8209 && \
    mvn clean package -e

WORKDIR /app

CMD java -jar target/util-bot-0.1.jar
