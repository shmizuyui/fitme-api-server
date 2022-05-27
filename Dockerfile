FROM ruby:3.1.2-alpine

WORKDIR /fitme-api-server
COPY Gemfile Gemfile.lock /fitme-api-server/

RUN apk add --no-cache -t .build-dependencies \
    alpine-sdk \
    build-base \
    mysql-client \
 && apk add --no-cache \ 
    bash \
    mysql-dev \
    nodejs \
    tzdata \
    yarn \
 && gem install bundler:2.0.2 \
 && bundle install \
 && apk del --purge .build-dependencies

COPY . /fitme-api-server