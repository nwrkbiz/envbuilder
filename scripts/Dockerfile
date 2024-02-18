FROM debian:12
ARG TARGETARCH

RUN apt-get update && \
    apt-get install -y git openssh-client curl jq psmisc
COPY envbuilder-${TARGETARCH} /.envbuilder/bin/envbuilder
COPY entrypoint.sh /.envbuilder/bin/entrypoint.sh

ENV KANIKO_DIR /.envbuilder
# Kaniko looks for the Docke config at $DOCKER_CONFIG/config.json
ENV DOCKER_CONFIG /.envbuilder

ENTRYPOINT  [ "/bin/bash", "-c", "/.envbuilder/bin/entrypoint.sh" ]