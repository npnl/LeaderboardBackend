FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /leaderboard
WORKDIR /leaderboard
RUN gem update bundler
COPY Gemfile /leaderboard/Gemfile
COPY Gemfile.lock /leaderboard/Gemfile.lock
RUN bundle install
COPY . /leaderboard
ENTRYPOINT bundle exec rails s -p 3000 -b '0.0.0.0'