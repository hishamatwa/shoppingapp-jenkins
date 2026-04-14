#!/bin/bash
docker rm -f merch-shop || true
docker run -d --name merch-shop \
  --ulimit nofile=65535:65535 \
  -p 8070:8070 \
  -e JAVA_OPTS="-Xms128m -Xmx512m -Djava.security.egd=file:/dev/./urandom -Djava.io.tmpdir=/tmp" \
  hishamatwa/shopping-cart:latest
