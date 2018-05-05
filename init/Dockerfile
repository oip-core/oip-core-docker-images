FROM itisopen/oip-base:latest
MAINTAINER Patrice Lachance

ENV VERSION=0.1

WORKDIR /opt/app/src

ENTRYPOINT ["./entrypoint.sh"]
CMD ["help"]

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

COPY ansible ./ansible

