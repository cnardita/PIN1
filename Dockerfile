FROM node:latest

WORKDIR /usr/src/app

ADD package.json package-lock.json /app/
RUN apt install npm

EXPOSE 3000

ADD . /app

CMD ["node", "index"]
