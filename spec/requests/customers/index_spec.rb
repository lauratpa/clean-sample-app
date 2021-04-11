require 'rspec'
require "rack/test"
require './config/app'

RSpec.describe 'GET /customers' do
  include Rack::Test::Methods

  let(:app) { App.freeze.app }

  it "returns customers view" do
    connection = Persistence::DatabaseService.instance.connection
    customer_repo = Persistence::Repositories::Customers.new(connection)
    customer_repo.create(name: 'John Doe')

    get "/customers"

    expect(last_response.status).to eq 200
    expect(last_response.body).to match('John Doe')
  end
end
