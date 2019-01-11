FROM centos:7.5.1804

MAINTAINER only "server888@yeah.net"

ENV JAVA_HOME=/usr/java/jdk
ENV CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
ENV PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH:$HOMR/bin

RUN mkdir -p /usr/java/ && \
    mkdir -p /usr/local/fn/ && \
    yum install -y curl && \
    cd /tmp && \
    curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz" && \
    curl -O http://219.238.4.226/files/71820000061FA5E4/mirrors.hust.edu.cn/apache/kafka/1.0.0/kafka_2.11-1.0.0.tgz && \
    tar zxf jdk-8u191-linux-x64.tar.gz -C /usr/java/ && \
    tar zxf kafka_2.11-1.0.0.tgz -C /usr/local/fn/ && \
    rm -rf /tmp/* && \
    mv /usr/java/jdk1.8.0_191  /usr/java/jdk && \
    cd /usr/local/fn/  && \
    mv kafka_2.11-1.0.0 kafka && \
    mkdir -p /usr/local/fn/kafka/log
    

EXPOSE 9092

ENTRYPOINT ["/usr/local/fn/kafka/bin/kafka-server-start.sh","/usr/local/fn/kafka/config/server.properties"]
