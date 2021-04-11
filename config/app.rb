require "roda"

ENV['APP_ENV'] ||= "development"

require "bundler"
Bundler.setup(:default, ENV["APP_ENV"])

require "dotenv"
Dotenv.load(".env", ".env.#{ENV["APP_ENV"]}")

require './lib/application/customers/queries/get_customer_list'
require './lib/application/employees/queries/get_employee_list'
require './lib/persistence/database_service'
require './lib/persistence/repositories/customers'
require './lib/persistence/repositories/employees'
require "./lib/presentation/home/controller"
require "./lib/presentation/customers/controller"
require "./lib/presentation/employees/controller"

class App < Roda
  route do |r|
    @connection = Persistence::DatabaseService.instance.connection
    @customer_repo = Persistence::Repositories::Customers.new(@connection)
    @employee_repo = Persistence::Repositories::Employees.new(@connection)

    r.root do
      r.redirect "/home"
    end

    r.get "home" do
      Presentation::Home::Controller::Index.new.call
    end

    r.get "customers" do
      Presentation::Customers::Controller::Index.new(
        get_customer_list_query: Application::Customers::Queries::GetCustomerList.new(@customer_repo)
      ).call
    end

    r.get "employees" do
      Presentation::Employees::Controller::Index.new(
        get_employee_list_query: Application::Employees::Queries::GetEmployeeList.new(@employee_repo)
      ).call
    end
  end
end
