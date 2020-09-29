#!/bin/bash
TARGET=schedule
REPO=registry.cn-shanghai.aliyuncs.com/advantech-k8s/
#REPO=harbor.arfa.wise-paas.com/ensaas-logging/
TAG=1.0.4
docker build -t ${REPO}${TARGET}:${TAG} -f ./Dockerfile .
docker push ${REPO}${TARGET}:${TAG}

