FROM openshift/jenkins-agent-maven-35-centos7:latest
MAINTAINER Ladislav Thon <lthon@redhat.com>

USER root

RUN yum -y install epel-release yum-plugin-copr && \
    yum -y copr enable alsadi/dumb-init && \
    yum -y install dumb-init jq xmlstarlet && \
    yum -y clean all && \
    rm -rf /var/cache/yum

USER 1001

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/usr/local/bin/run-jnlp-client"]
