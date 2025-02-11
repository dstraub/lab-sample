FROM registry.access.redhat.com/ubi9

ARG PACKAGES="nginx less lsof bind-utils"
ARG USER_ID=99999
ARG WEBSERVER_VERSION='not provided'

ENV WEBSERVER_VERSION=$WEBSERVER_VERSION
LABEL webserver.version=$WEBSERVER_VERSION

RUN dnf install -qy $PACKAGES && \
    rm -rf /usr/share/nginx/html/* && \
    chmod 0775 /var/log/nginx /usr/share/nginx/html && \
    dnf clean -q all

COPY nginx.conf /etc/nginx/nginx.conf
COPY --chmod=0755 run.sh /usr/local/bin

USER $USER_ID
EXPOSE 8080

CMD ["run.sh"]

