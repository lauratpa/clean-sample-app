require "rom/sql/rake_task"
require "./lib/persistence/database_service"

ENV["APP_ENV"] ||= "development"

require "dotenv"
Dotenv.load(".env", ".env.#{ENV["APP_ENV"]}")

namespace :db do
  task :setup do
    ROM::SQL::RakeSupport.env = ROM.container(:sql, ENV["DATABASE"])
  end
end
