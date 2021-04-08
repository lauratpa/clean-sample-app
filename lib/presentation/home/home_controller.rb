require_relative '../base_controller'

module Presentation::Home
  class HomeController
    class Index < Presentation::BaseController
      def call
        view('home/views/index')
      end
    end
  end
end
