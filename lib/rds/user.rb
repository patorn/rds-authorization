module Rds
  class User < ActiveRecord::Base

    belongs_to :role
    
    def role_can?(permissions)
      permissions = [ permissions ] if permissions.class != Array

      if role.present?
        permissions.each do |permission|
          return false if role.can?(permission) == false
        end

        return true
      end
    end
  end
end