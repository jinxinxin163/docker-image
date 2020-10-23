#FROM ubuntu:18.04
FROM ubuntu:bionic

LABEL maintainer="Steve Kriss <krisss@vmware.com>"

RUN apt-get update && \
	apt-get install -y --no-install-recommends ca-certificates wget bzip2 vim

COPY ./tools/kubectl /bin/kubectl
COPY ./tools/kubectl-debug /usr/local/bin/kubectl-debug
COPY ./yaml/debug-agent.yaml /root/debug-agent.yaml
RUN chmod +x /bin/kubectl
RUN chmod +x /usr/local/bin/kubectl-debug
RUN mkdir -p /opt/.kube/

RUN apt-get update && \
	apt-get install -y --no-install-recommends ca-certificates wget bzip2
