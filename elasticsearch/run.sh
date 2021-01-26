#!/bin/bash

# Copyright 2017 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

export NODE_NAME=${NODE_NAME:-${HOSTNAME}}
export NODE_MASTER=${NODE_MASTER:-true}
export NODE_DATA=${NODE_DATA:-true}
export HTTP_PORT=${HTTP_PORT:-9200}
export TRANSPORT_PORT=${TRANSPORT_PORT:-9300}
export MINIMUM_MASTER_NODES=${MINIMUM_MASTER_NODES:-2}

chown -R elasticsearch:elasticsearch /data

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
./bin/elasticsearch-plugin install -b repository-s3

./bin/elasticsearch-keystore create
sh -c '/bin/echo -e "minio" | sh ./bin/elasticsearch-keystore add s3.client.default.access_key'
sh -c '/bin/echo -e "minio123" | sh ./bin/elasticsearch-keystore add s3.client.default.secret_key'
chmod 777 /usr/share/elasticsearch/config/elasticsearch.keystore

#./bin/elasticsearch-keystore remove s3.client.default.access_key
#echo "minio"|./bin/elasticsearch-keystore add  s3.client.default.access_key
#./bin/elasticsearch-keystore remove s3.client.default.secret_key
#echo "minio123"|./bin/elasticsearch-keystore add s3.client.default.secret_key

./bin/elasticsearch_logging_discovery >> ./config/elasticsearch.yml
exec su elasticsearch -c /usr/share/elasticsearch/bin/docker-entrypoint.sh
#exec su elasticsearch -c /elastic-entrypoint.sh
