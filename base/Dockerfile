FROM alpine:latest
MAINTAINER Patrice Lachance

ENV VERSION 0.1

RUN apk update && \
    apk add ansible git jq bash && \
    addgroup -g 1000 cip && \
    adduser -u 1000 -G cip -h /data -D -H cip && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    echo "**** install pip modules ****" && \
    pip3 install --no-cache --upgrade botocore boto boto3 click && \
    pip3 install --no-cache --upgrade --ignore-installed 'PyYAML>=3.10,<5.2' 'python-dateutil>=2.1,<2.8.1' awscli awscli-cwlogs awscli-plugin-endpoint

ADD assets/ /

