FROM node:latest

WORKDIR /usr/src/app

COPY package*.json /app/
RUN npm install

EXPOSE 3000

ADD . /app

CMD ["node", "index"]
