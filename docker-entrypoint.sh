#!/bin/sh
if [ ! -f /etc/radicale/config ]; then
	mkdir -p /etc/radicale
	mv /config /etc/radicale/config
fi

exec "$@"
