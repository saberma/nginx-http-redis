FROM ruby:2.0

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y nodejs imagemagick mysql-client
RUN rm -rf /var/lib/apt/lists/*

RUN gem install rails -v 4.0.9 --no-ri --no-rdoc

RUN mkdir -p /u/apps/rails
WORKDIR /u/apps/rails

#RUN bundle install

#CMD ["rails", "-s"]

#EXPOSE 3000
