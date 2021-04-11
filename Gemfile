# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "roda"
gem "puma"
gem "rom-sql"
gem "rom-repository"
gem "rake"
gem "sqlite3"
gem "rack-test"
gem "dotenv"

group :test, :development do
  gem "standard"
  gem "rspec"
end

group :test do
  gem "simplecov", require: false
end
