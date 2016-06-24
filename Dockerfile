FROM stackci/node:6

EXPOSE 80

MAINTAINER Jonathan Dunlap  <jdunlap@outlook.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./package.json .
RUN npm install --production

COPY . .

# Run sqsd
ENTRYPOINT []
CMD echo "sqsd starting" \
    && export SQSD_WORKER_HTTP_URL=${SQSD_WORKER_PORT_80_TCP_ADDR:=$SQSD_WORKER_HTTP_URL} \
    && export SQSD_WORKER_HTTP_URL=http://${SQSD_WORKER_PORT_8800_TCP_ADDR:=$SQSD_WORKER_HTTP_URL} \
    && echo "worker_url ${SQSD_WORKER_HTTP_URL}" \
    && npm start
