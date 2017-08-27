FROM ruby:2.4.1
MAINTAINER Hiroto MIZOKI <h.mizoki@gmail.com>

ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler

RUN mkdir /railsapp-template
WORKDIR /railsapp-template

ADD src/Gemfile /railsapp-template
ADD src/Gemfile.lock /railsapp-template

RUN bundle install

