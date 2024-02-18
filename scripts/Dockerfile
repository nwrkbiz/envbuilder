FROM alpine:3
ARG TARGETARCH

RUN apk add git openssh-client-default
COPY envbuilder-${TARGETARCH} /.envbuilder/bin/envbuilder
COPY entrypoint.sh /.envbuilder/bin/entrypoint.sh

ENV KANIKO_DIR /.envbuilder
# Kaniko looks for the Docke config at $DOCKER_CONFIG/config.json
ENV DOCKER_CONFIG /.envbuilder

ENTRYPOINT  [ "/.envbuilder/bin/entrypoint.sh" ]
