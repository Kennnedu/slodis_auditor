# syntax=docker/dockerfile:1
FROM ruby:3.0.0
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

WORKDIR .

EXPOSE 4000

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY package.json .
COPY yarn.lock .
RUN yarn install

# Configure the main process to run when running the image
#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "4000"]
