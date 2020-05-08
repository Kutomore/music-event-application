FROM ruby:2.6.3
LABEL Matheus Lima <kutomore@gmail.com>
RUN mkdir /music-event-application
WORKDIR /music-event-application
COPY . /music-event-application
RUN bundle install

