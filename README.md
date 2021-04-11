# clean-sample-app
Working through https://github.com/matthewrenze/clean-architecture-demo with ruby

Run the app with
```
bundle install
bundle exec rake db:migrate
rackup
```

Run the specs with
```
APP_ENV=test bundle exec rake db:migrate
bundle exec rspec
```
