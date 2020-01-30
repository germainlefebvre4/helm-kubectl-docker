FROM alpine:3.4

MAINTAINER Germain LEFEBVRE <germain.lefebvre4@gmail.com@gmail.com>

ARG KUBECTL_VERSION
ARG HELM_VERSION
ENV HELM_FILENAME=helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN echo ${KUBECTL_VERSION} ${HELM_VERSION} ${HELM_FILENAME}

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl  \
 && apk add --update gettext tar gzip \
 && curl -fL https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && curl -fL https://get.helm.sh/${HELM_FILENAME} | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

CMD ["/bin/helm"]
