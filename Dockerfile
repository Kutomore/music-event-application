FROM ruby:2.6.3
LABEL Matheus Lima <kutomore@gmail.com>
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

RUN mkdir /music-event-application
WORKDIR /music-event-application
COPY . /music-event-application
RUN bundle install
RUN yarn install
RUN yarn install --check-files
