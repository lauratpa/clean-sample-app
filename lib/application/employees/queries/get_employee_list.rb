module Application
  module Employees
    module Queries
      class GetEmployeeList
        def initialize(repository)
          @repository = repository
        end

        def call
          repository.all
        end

        private

        attr_reader :repository
      end
    end
  end
end
