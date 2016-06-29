#!/bin/sh
echo "sqsd starting"
if [ -n "$SQSD_WORKER_PORT_80_TCP_ADDR" ]; 
	export SQSD_WORKER_HTTP_URL=http://${SQSD_WORKER_PORT_80_TCP_ADDR}:8800/sqs; 
fi

if [ -n "$SQSD_WORKER_PORT_8800_TCP_ADDR" ];
	export SQSD_WORKER_HTTP_URL=http://${SQSD_WORKER_PORT_8800_TCP_ADDR}:8800/sqs; 
fi

export SQSD_WORKER_HTTP_URL=${SQSD_WORKER_HTTP_URL}
echo "worker_url ${SQSD_WORKER_HTTP_URL}"
echo "npm start"

exec node cli.js
