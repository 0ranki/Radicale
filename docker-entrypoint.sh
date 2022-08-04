#!/bin/sh
if [ ! -f /etc/radicale/config ]; then
	mkdir -p /etc/radicale
	cp /config /etc/radicale/config
	cp /rights /etc/radicale/rights
fi

exec "$@"
