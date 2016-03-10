# The tagging scheme is <Mesos version>-<Spark Version>-<Hadoop Version>.
#
# Changelog:
# 0.1.0  Initial version.
FROM echinthaka/mesos:0.23.1

ENV DEBIAN_FRONTEND noninteractive

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV MESOS_NATIVE_JAVA_LIBRARY /usr/lib/libmesos.so

ENV SPARK_VERSION=1.6.0
ENV HADOOP_VERSION=2.6

# Install Java 8.
RUN apt-get -y update && \
  apt-get install -y software-properties-common curl net-tools unzip && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get -y update && \
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | /usr/bin/debconf-set-selections && \
  apt-get install -y oracle-java8-installer

# Setup mesos/spark.
ENV SPARK_PACKAGE spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION
ENV SPARK_HOME /usr/$SPARK_PACKAGE
ENV PATH $PATH:$SPARK_HOME/bin
RUN curl -sL --retry 3 "http://d3kbcqa49mib13.cloudfront.net/$SPARK_PACKAGE.tgz" \
  | gunzip | tar x -C /usr/ \
  && ln -s $SPARK_HOME /usr/spark \  
  && apt-get -yf autoremove curl unzip \ 
  && apt-get clean \  
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $SPARK_HOME
CMD ["bin/spark-class", "org.apache.spark.deploy.master.Master"]
