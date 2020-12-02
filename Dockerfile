FROM ubuntu:18.04

COPY ipfs /usr/local/bin/ipfs

RUN ipfs init \
  && ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin "[\"*\"]" \
  && sed -i 's/127.0.0.1/0.0.0.0/g' /root/.ipfs/config

CMD IPFS_LOGGING=info ipfs daemon --enable-pubsub-experiment --enable-namesys-pubsub
