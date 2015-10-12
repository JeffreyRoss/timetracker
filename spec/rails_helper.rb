# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'
require 'capybara/rspec'
require 'capybara/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Capybara.app_host = 'http://lvh.me:3000'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  #config.include Devise::testHelpers, type: :controller
  config.order = "random"

  config.before(:suite) do  
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do  
    DatabaseCleaner.start
  end

  config.after(:each) do  
    DatabaseCleaner.clean
    Apartment::Tenant.reset
    drop_schemas
  end

  config.include Rails.application.routes.url_helpers  

  config.include Capybara::DSL  
end

