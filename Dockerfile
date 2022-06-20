FROM ruby:3.1.2-alpine

WORKDIR /fitme-api-server
COPY Gemfile Gemfile.lock /fitme-api-server/

RUN apk add --no-cache -t .build-dependencies \
    alpine-sdk \
    build-base \
    mysql-client \
 && apk add --no-cache \
    xz \ 
    bash \
    mysql-dev \
    nodejs \
    tzdata \
    yarn \
    vim \
    git \
 && gem install bundler:2.3.14 \
 && bundle config set force_ruby_platform true \
 && bundle install \
 && apk del --purge .build-dependencies

COPY . /fitme-api-server
