require 'erb'
require './lib/persistence/database_service'

module Presentation
  class BaseController
    def view(path)
      template = ERB.new(File.read("./lib/presentation/#{path}.html.erb"))

      layout do
        template.result(binding)
      end
    end

    def layout
      template = ERB.new(File.read('./lib/presentation/layouts/layout.html.erb'))

      template.result(binding)
    end
  end
end
