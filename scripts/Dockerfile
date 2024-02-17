FROM alpine:3
ARG TARGETARCH

RUN apk add openssh-client-common
COPY envbuilder-${TARGETARCH} /.envbuilder/bin/envbuilder

ENV KANIKO_DIR /.envbuilder
# Kaniko looks for the Docke config at $DOCKER_CONFIG/config.json
ENV DOCKER_CONFIG /.envbuilder

ENTRYPOINT ["/.envbuilder/bin/envbuilder"]
