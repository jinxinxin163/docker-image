#!/bin/bash
TARGET=elasticsearch
#REPO=registry.cn-shanghai.aliyuncs.com/advantech-k8s/
REPO=harbor.arfa.wise-paas.com/ensaas-logging/
TAG=7.6.0-2
docker build -t ${REPO}${TARGET}:${TAG} -f ./Dockerfile .
docker push ${REPO}${TARGET}:${TAG}

