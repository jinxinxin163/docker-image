#!/bin/bash
TARGET=fluentd-elasticsearch
REPO=harbor.arfa.wise-paas.com/ensaas-logging/
#REPO=registry.cn-shanghai.aliyuncs.com/advantech-k8s/
TAG=v1.9.1-1.0
docker build -t ${REPO}${TARGET}:${TAG} -f ./Dockerfile .
docker push ${REPO}${TARGET}:${TAG}

