FROM node:latest

WORKDIR /usr/src/app

COPY package*.json /usr/src/app/
RUN npm install

EXPOSE 3000

ADD . /app

CMD ["node", "index"]
