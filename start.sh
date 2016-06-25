#!/bin/sh
echo "sqsd starting" \
&& export SQSD_WORKER_HTTP_URL=${SQSD_WORKER_PORT_80_TCP_ADDR:=$SQSD_WORKER_HTTP_URL} \
&& if [ -n "$SQSD_WORKER_PORT_8800_TCP_ADDR" ]; then export SQSD_WORKER_HTTP_URL=${SQSD_WORKER_PORT_8800_TCP_ADDR}:8800; fi \
&& export SQSD_WORKER_HTTP_URL=http://${SQSD_WORKER_HTTP_URL} \
&& echo "worker_url ${SQSD_WORKER_HTTP_URL}" \
&& echo "npm start"

exec node cli.js
