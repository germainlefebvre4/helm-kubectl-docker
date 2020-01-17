FROM alpine:3.4

MAINTAINER Germain LEFEBVRE <germain.lefebvre4@gmail.com@gmail.com>

ARG KUBE_VERSION=v1.15.0
ARG HELM_VERSION=v2.14.0
ENV HELM_FILENAME=helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN echo ${KUBE_VERSION} ${HELM_VERSION} ${HELM_FILENAME}

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl  \
 && apk add --update gettext tar gzip \
 && curl -fL https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && curl -fL https://get.helm.sh/${HELM_FILENAME} | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

ENTRYPOINT ["/bin/helm"]
