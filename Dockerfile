FROM alpine:3.18.0

  // # hadolint ignore=DL3018
  RUN apk --update --no-cache add libqrencode \
      && rm -rf /var/cache/apk/*
