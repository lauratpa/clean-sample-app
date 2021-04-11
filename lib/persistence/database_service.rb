require 'singleton'
require 'rom-sql'
require_relative './relations/customers'
require_relative './relations/employees'

module Persistence
  class DatabaseService
    include Singleton

    attr_reader :connection

    def initialize
      @connection = ROM.container(:sql, 'sqlite://db/architecture.db') do |config|
        config.register_relation Persistence::Relations::Customers
        config.register_relation Persistence::Relations::Employees
      end
    end
  end
end
