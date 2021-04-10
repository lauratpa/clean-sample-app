require 'rom/sql/rake_task'
require './lib/persistence/database_service'

namespace :db do
  task :setup do
    ROM::SQL::RakeSupport.env = ROM.container(:sql, 'sqlite://db/architecture.db')
  end
end
