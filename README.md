# WeatherStation - README
- rails application for managing Arduino weather sensors

### Development Setup / Get Started
```
# Setup .env file
# http://www.openweathermap.org
WEATHER_API_KEY=XXXXX

# Setup free airbrake account
AIRBRAKE_PROJECT_ID=XXXX
AIRBRAKE_PROJECT_KEY=xxxxx

# EMAIL -
EMAIL=email@email.com

# Install Gems
$ bundle install

# Install JS Libs
$ yarn install

# Setup DB & Test Data
$ rake db:migrate
$ rake db:seed

```

### Notes
- notes and tasks are now managed by waffle.io and can be seen in the issues tab

### API Example
```
curl -X POST -H "Content-Type: application/json" \
  -H "Cache-Control: no-cache" \
  -H "Authorization: Token token=<API-KEY>" \
  -d '{"weather_datum": {"temp": 81.0, "humidity": 30.0", location: 'loft' }}' \
  "http://localhost:3000/v1/weather_data"

=> {"status":"Record was created!","notification":true}
```

## Specs
- Ruby 2.4.0
- Rail 5.1.1

### Frontend
  - Yarn / Node
  - bootstrap
  - jquery
  - font awesome

### Database
  - sqlite3 - development
  - postgres - production

## Whenever Gem/Cron Jobs
- config/schedule.rb
  - set to run job every 15 minutes - grabs current outside weather and stores to DB

## Deploy
- Uses capistrano to deploy to production
- Created Production server using Centos, Nginx, & Passenger

```
# Deploy to Production
# Config capistrano
$ bundle exec cap production deploy

# to create more admin users on production
$ bundle exec cap production rails console
```

## Heroku
```
heroku create OR heroku remote:git -a <name>

# Add NodeJS first, then ruby - This will get yarn working
$ heroku buildpacks:add heroku/nodejs
$ heroku buildpacks:add heroku/ruby

# Set ENV VARS
$ heroku config:set VAR=xxxx

# Deploy
$ git push heroku master

# Setup Database
$ heroku run rake db:migrate
$ heroku run rake db:seed

# db:seed creates a test admin user, but for security reasons users can only be created via:
$ heroku run rails console

# set up Heroku Scheduler to run:
$ rake outside_weather:current
```
