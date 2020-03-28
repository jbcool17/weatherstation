FROM ws:base

WORKDIR /app

COPY . /app

RUN bundle install \
 && yarn install

#COPY development.sqlite3 db/development.sqlite3
#RUN rake db:migrate \
# && rake db:seed

COPY start.sh .

ENTRYPOINT ["/app/start.sh"]
