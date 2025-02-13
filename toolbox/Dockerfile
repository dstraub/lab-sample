FROM registry.access.redhat.com/ubi9/ubi
ENV PACKAGES "bind-utils iputils jq less lsof openssl tar unzip"
RUN dnf -y install --nodocs --setopt=install_weak_deps=False $PACKAGES && dnf clean all
CMD /usr/bin/bash
