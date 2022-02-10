
ENV["RAILS_ENV"] ||= 'test'

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'



ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Warden::Test::Helpers
  config.include FactoryBot::Syntax::Methods
  config.include Rails.application.routes.url_helpers
  config.infer_spec_type_from_file_location!
  config.include Capybara::DSL
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end