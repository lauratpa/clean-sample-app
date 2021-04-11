require 'rom-repository'

require './lib/domain/customer'

module Persistence
  module Repositories
    class Customers < ROM::Repository[:customers]
      commands(
        :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }
      )

      def all
        customers.map_to(Domain::Customer).to_a
      end
    end
  end
end
