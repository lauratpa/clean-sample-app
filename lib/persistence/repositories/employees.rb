require 'rom-repository'

require './lib/domain/employee'

module Persistence
  module Repositories
    class Employees < ROM::Repository[:employees]
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
        employees.map_to(Domain::Employee).to_a
      end
    end
  end
end
