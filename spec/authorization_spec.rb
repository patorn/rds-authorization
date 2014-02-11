require 'spec_helper'

describe 'My gem' do

  context "in a Rails controller", :type => :controller do

    controller(TestRailsApp::ApplicationController) do
      include Rds::Authorization
      include Rails.application.routes.url_helpers

      # example-specific setup for anonymous controller
      # https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/anonymous-controller
      def index
      end
    end
  end

end