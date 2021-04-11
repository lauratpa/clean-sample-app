require_relative "../base_controller"

module Presentation
  module Employees
    class Controller
      class Index < Presentation::BaseController
        def initialize(get_employee_list_query:)
          @get_employee_list_query = get_employee_list_query
        end

        def call
          @employees = @get_employee_list_query.call
          view("employees/views/index")
        end
      end
    end
  end
end
