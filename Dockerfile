FROM ruby:2.3.1-alpine

RUN apk add --no-cache git

RUN mkdir -p /fakes3/data

WORKDIR /fakes3

RUN echo "gem 'fakes3', path: '.'" > Gemfile && bundle install

ADD . .

ENV PORT 4567

EXPOSE 4567

CMD bundle exec fakes3 -r /fakes3/data -p $PORT