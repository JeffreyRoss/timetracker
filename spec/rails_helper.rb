# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'
require 'capybara/rspec'
require 'capybara/rails'

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

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
  end

  config.include Rails.application.routes.url_helpers  

  config.include Capybara::DSL  
end

