FROM node:9-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++ \
        git \
    && npm install \
    && apk del .gyp

COPY . .

EXPOSE 8000

CMD npm start
