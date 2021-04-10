require "roda"

require "./lib/presentation/home/controller"
require "./lib/presentation/customers/controller"

class App < Roda
  route do |r|
    r.root do
      r.redirect "/home"
    end

    r.get "home" do
      Presentation::Home::Controller::Index.new.call
    end

    r.get "customers" do
      Presentation::Customers::Controller::Index.new.call
    end
  end
end

run App.freeze.app
