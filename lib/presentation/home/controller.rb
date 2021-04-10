require_relative '../base_controller'

module Presentation
  module Home
    class Controller
      class Index < Presentation::BaseController
        def call
          view('home/views/index')
        end
      end
    end
  end
end
