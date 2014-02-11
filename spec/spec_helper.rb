require 'rubygems'
require 'bundler/setup'

require 'active_record'
require 'rds/authorization'
require 'rds/role'
require 'rds/user'
require 'rails'
require 'rails-api'
require 'action_controller/railtie' # allows ActionController::Base
require 'rspec/rails'

RSpec.configure do |config|
end

module TestRailsApp
  class Application < Rails::Application
    # app config here
    config.secret_token = '572c86f5ede338bd8aba8dae0fd3a326aabababc98d1e6ce34b9f5'

    # routes.draw do
    #   resources :models
    # end
  end

  class ApplicationController < ActionController::Base
    # setup
  end

end