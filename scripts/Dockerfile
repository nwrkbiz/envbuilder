FROM alpine:3
ARG TARGETARCH

RUN apk add git openssh-client-default curl jq psmisc
COPY envbuilder-${TARGETARCH} /.envbuilder/bin/envbuilder
COPY entrypoint.sh /.envbuilder/bin/entrypoint.sh

ENV KANIKO_DIR /.envbuilder
# Kaniko looks for the Docke config at $DOCKER_CONFIG/config.json
ENV DOCKER_CONFIG /.envbuilder

ENTRYPOINT  [ "/bin/sh", "-c", "/.envbuilder/bin/entrypoint.sh" ]