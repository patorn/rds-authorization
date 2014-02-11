require "rds/authorization/version"
require "rds/role"
require "rds/user"

module Rds
  module Authorization

    def self.included(base)

      if defined?(ActionController::Base)
        base < ActionController::Base
      end

      if defined?(ActionController::API)
        base < ActionController::API
      end

      base.helper_method :current_user, :can?
    end

    protected

    # if can't find current user for the current request, try to find authenticate by token
    def current_user
      if @current_user.present?
        @current_user
      else
        authentication_token = params[:authentication_token].presence
        @current_user = authentication_token && User.find_by_authentication_token(authentication_token)
      end
    end

    def can?(permission)
      current_user.present? && current_user.role_can?(permission)
    end
  end
end