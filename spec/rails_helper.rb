require 'coveralls'
Coveralls.wear_merged!('rails')
require 'webmock/rspec'
WebMock.enable!

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include Shoulda::Matchers::ActiveRecord, type: :model
  config.before do
  
    stub_request(:get, "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Margarita").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'www.thecocktaildb.com'

      }).
    to_return(status: 200, body: file_fixture('cocktails_api_margarita_response.json').read, headers: {})


    stub_request(:get, "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=hgjhvhj").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'www.thecocktaildb.com'
      }).
    to_return(status: 200, body: "{\"drinks\":nil}", headers: {})


  end
end
