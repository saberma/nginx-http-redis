FROM ruby:2.0

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs imagemagick mysql-client
RUN rm -rf /var/lib/apt/lists/*

RUN gem install rails -v 4.0.9 --no-ri --no-rdoc

RUN mkdir -p /u/apps/rails
WORKDIR /u/apps/rails
COPY foo/Gemfile* /u/apps/rails/

RUN mkdir -p /u/apps/redis_page
COPY redis_page /u/apps/redis_page

RUN bundle install

#ENV RAILS_ENV production

EXPOSE 3000
