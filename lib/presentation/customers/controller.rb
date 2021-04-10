require_relative '../base_controller'
require './lib/application/customers/queries/get_customer_list'
require './lib/persistence/repositories/customers'

module Presentation
  module Customers
    class Controller
      class Index < Presentation::BaseController
        def call
          @customers = Application::Customers::Queries::GetCustomerList.new(customer_repo).call
          view('customers/views/index')
        end

        private

        def customer_repo
          @customers = Persistence::Repositories::Customers.new(connection)
        end
      end
    end
  end
end
