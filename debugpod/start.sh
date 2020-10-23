#!/bin/bash
kubectl run debugpod -it --image=registry.cn-shanghai.aliyuncs.com/advantech-k8s/debugpod:1.0.0  --limits=cpu=500m,memory=512Mi,ephemeral-storage=3000Mi --requests=cpu=100m,memory=256Mi,ephemeral-storage=1500Mi
