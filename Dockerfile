FROM node:11.1.0-alpine

WORKDIR /usr/src/app

ADD package.json package-lock.json /app/
RUN npm install

EXPOSE 3000

ADD . /app

CMD ["node", "index"]
