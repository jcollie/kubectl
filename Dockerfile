FROM --platform=${BUILDPLATFORM} alpine:3.14

RUN apk update --no-cache && \
    apk add --no-cache --virtual .run-deps ca-certificates curl jq && \
    VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt) && \
    curl -L https://dl.k8s.io/release/${VERSION}/bin/${BUILDPLATFORM}/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl
