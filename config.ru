require "roda"

require "./lib/presentation/home/controller"
require "./lib/presentation/customers/controller"
require './lib/persistence/database_service'
require './lib/persistence/repositories/customers'
require './lib/application/customers/queries/get_customer_list'

class App < Roda
  route do |r|
    @connection = Persistence::DatabaseService.instance.connection
    @customer_repo = Persistence::Repositories::Customers.new(@connection)

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
  end
end

run App.freeze.app
