ARG BASE_IMAGE=node:16.20.0-alpine
FROM --platform=linux/amd64 $BASE_IMAGE
USER root

RUN apk add --update --no-cache zstd git

ARG BVM_VERSION=0.3.1
ARG BIT_VERSION=0.0.1000

RUN npm i @teambit/bvm@$BVM_VERSION -g
ENV PATH=$PATH:/root/bin
RUN bvm install $BIT_VERSION

ENV NODE_OPTIONS=--max_old_space_size=4096

RUN bit config set analytics_reporting false
RUN bit config set no_warnings false
RUN bit config set interactive false
RUN bit config set error_reporting true

COPY ./start.sh /root/bin/start.sh
COPY ./remote-resolve.js /root/bin/remote-resolve.js
RUN chmod +x /root/bin/start.sh

ENV SCOPE=
ENV SCOPE_REMOTES=

ENTRYPOINT [ "start.sh" ]
CMD []
