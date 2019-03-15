FROM alpine:3.8


ENV SPARK_VERSION=2.4.0
ENV HADOOP_VERSION=2.7

RUN apk add --no-cache curl bash openjdk8-jre python3 py-pip \
      && chmod +x *.sh \
      && wget http://apache.mirror.iphh.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \

WORKDIR /app
COPY target/scala-2.11/NLPIR-2019-assembly-1.3.jar /app