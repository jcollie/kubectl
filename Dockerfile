FROM alpine:3.14
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"
RUN apk update --no-cache && \
    apk add --no-cache --virtual .run-deps ca-certificates curl jq && \
    VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) && \
    curl -L https://dl.k8s.io/release/${VERSION}/bin/${TARGETPLATFORM}/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl
