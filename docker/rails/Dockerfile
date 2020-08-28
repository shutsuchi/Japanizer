FROM ruby:2.5.7

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  default-mysql-client 

RUN mkdir /Japanizer

ENV APP_ROOT /Japanizer
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install -j4
ADD . $APP_ROOT


EXPOSE 3000

