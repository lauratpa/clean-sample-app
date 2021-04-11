require 'rspec'
require "rack/test"
require './config/app'

RSpec.describe 'GET /employees' do
  include Rack::Test::Methods

  let(:app) { App.freeze.app }

  it "returns employees view" do
    connection = Persistence::DatabaseService.instance.connection
    employee_repo = Persistence::Repositories::Employees.new(connection)
    employee_repo.create(name: 'John Doe')

    get "/employees"

    expect(last_response.status).to eq 200
    expect(last_response.body).to match('John Doe')
  end
end
