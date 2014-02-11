module Rds
  module User
    extend ActiveSupport::Concern
    
    included do
      belongs_to :role
    end
    
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