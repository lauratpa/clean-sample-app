require "rom-sql"

module Persistence
  module Relations
    class Employees < ROM::Relation[:sql]
      schema(:employees, infer: true)
    end
  end
end
