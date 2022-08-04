# This file is intended to be used apart from the containing source code tree.

FROM python:3-alpine

# Version of Radicale
ARG VERSION=v3
# Persistent storage for data
VOLUME /var/lib/radicale
# Persistent storage for configuration
VOLUME /etc/radicale
# TCP port of Radicale
EXPOSE 5232
# Run Radicale
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["radicale", "--hosts", "0.0.0.0:5232"]

ADD config /
RUN apk add --no-cache ca-certificates openssl \
 && apk add --no-cache --virtual .build-deps gcc libffi-dev musl-dev \
 && pip install --no-cache-dir "Radicale[bcrypt] @ https://github.com/Kozea/Radicale/archive/${VERSION}.tar.gz" \
 && apk del .build-deps
