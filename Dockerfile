FROM stackci/node:6

EXPOSE 80

MAINTAINER Jonathan Dunlap  <jdunlap@outlook.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./package.json .
RUN npm install --production

COPY . .

# Run sqsd
ENTRYPOINT ["npm"]
CMD ["start"]
