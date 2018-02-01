FROM openshift/jenkins-slave-maven-centos7:latest
MAINTAINER Ladislav Thon <lthon@redhat.com>

USER root

RUN yum -y install epel-release && \
    yum -y install jq && \
    yum clean all -y

USER 1001
