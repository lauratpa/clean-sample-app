require_relative '../base_controller'

module Presentation
  module Customers
    class Controller
      class Index < Presentation::BaseController
        def initialize(get_customer_list_query:)
          @get_customer_list_query = get_customer_list_query
        end

        def call
          @customers = @get_customer_list_query.call
          view('customers/views/index')
        end
      end
    end
  end
end
