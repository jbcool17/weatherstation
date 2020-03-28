FROM ws:base

WORKDIR /app

COPY . /app

RUN gem install bundler -v 2.1.4
RUN bundle update --bundler
RUN bundle install
RUN yarn install

#COPY development.sqlite3 db/development.sqlite3
#RUN rake db:migrate \
# && rake db:seed

COPY start.sh .

ENTRYPOINT ["/app/start.sh"]
