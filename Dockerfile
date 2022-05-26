FROM ruby:3.1.2-alpine

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim

RUN mkdir /fitme-api-server

WORKDIR /fitme-api-server

COPY Gemfile /fitme-api-server/Gemfile
COPY Gemfile.lock /fitme-api-server/Gemfile.lock

RUN bundle install

COPY . /fitme-api-server
