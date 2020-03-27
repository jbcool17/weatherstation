FROM ruby:2.4.0

RUN apt update \
 && apt upgrade -y --force-yes \
 && apt install -y apt-transport-https

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
 && apt update \
 && apt install nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt update \
 && apt install yarn -y


WORKDIR /app

COPY . /app

RUN bundle install \
 && yarn install

#COPY development.sqlite3 db/development.sqlite3
#RUN rake db:migrate \
# && rake db:seed

ENTRYPOINT ["rails", "server"]
