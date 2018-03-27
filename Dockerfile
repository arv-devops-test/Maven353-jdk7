FROM jboss/base-jdk:7

USER root

RUN cd /tmp && \
        curl -LO http://www-us.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz && \
        tar -zxvf apache-maven-3.5.3-bin.tar.gz && \
        mv /tmp/apache-maven-3.5.3 /opt && \
        chown -R root:root /opt/apache-maven-3.5.3 && \
        rm -rf /tmp/apache-maven-3.5.3-bin.tar.gz && \
        ln -s /opt/apache-maven-3.5.3 /opt/apache-maven


ENV PATH="/opt/apache-maven/bin:${PATH}" JAVA_VERSION="1.7.0" container="kubernetes"

LABEL io.k8s.description="Maven 3.5.3 build container with JDK 1.7" \
        com.redhat.dev-mode.port="JPDA_ADDRESS:8000" \
        version="0.5"

USER 0
