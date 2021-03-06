FROM mhart/alpine-node:5.4
MAINTAINER Code Climate <hello@codeclimate.com>

WORKDIR /usr/src/app
COPY npm-shrinkwrap.json /usr/src/app/
COPY package.json /usr/src/app/

RUN apk --update add git && \
    npm install && \
    apk del --purge git

RUN adduser -u 9000 -D app
COPY . /usr/src/app
RUN chown -R app:app /usr/src/app

USER app

VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/eslint.js"]
