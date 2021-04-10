module Application
  module Customers
    module Queries
      class GetCustomerList
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
