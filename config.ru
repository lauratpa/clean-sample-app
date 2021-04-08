require "roda"

require "./lib/presentation/home/home_controller"

class App < Roda
  route do |r|
    r.root do
      r.redirect "/home"
    end

    r.get "home" do
      Presentation::Home::HomeController::Index.new.call
    end
  end
end

run App.freeze.app
