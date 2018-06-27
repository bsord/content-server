FROM ubuntu:16.04

MAINTAINER Brandon Sorgdrager <Brandon.Sorgdrager@gmail.com>

# Install dependencies
RUN mkdir /usr/src/media; mkdir /usr/src/media/_thumbnails; chmod -R 777 /usr/src/media
RUN apt-get update;apt-get install nodejs-legacy npm mongodb imagemagick libav-tools git -y
RUN npm install pm2 -g
WORKDIR /usr/src/app
RUN mkdir /usr/src/db
RUN git clone https://github.com/bsord/content-server/ . && npm install

CMD ["/bin/sh", "-c", "service mongodb start; node server.js; sleep 5s; npm start"]
#CMD ["node", "server.js"]
