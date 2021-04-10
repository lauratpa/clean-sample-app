require 'rom-sql'

module Persistence
  module Relations
    class Customers < ROM::Relation[:sql]
      schema(:customers, infer: true)
    end
  end
end
