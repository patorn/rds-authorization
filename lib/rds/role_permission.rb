module Rds
  module RolePermission
    
    extend ActiveSupport::Concern

    included do
      store_accessor :permissions
      has_many :users
    end

    def can?(permission)
      if permissions.present?
        !!( self.permissions[permission.to_s] || self.permissions[permission.to_sym] )
      else
        false
      end
    end

    def merge_permissions=(_permissions)
      self.permissions ||= {}
      _permissions ||= {}
      
      self.permissions = self.permissions.merge(_permissions)
    end

    def permissions
      _permissions = read_attribute(:permissions) || {}
      _permissions.each { |k,v| _permissions[k] = to_bool(v) if v.class == String }
    end

    def to_bool(value)
      return true   if value == true   || value =~ (/(true|t|yes|y|1)$/i)
      return false  if value == false  || value.blank? || value =~ (/(false|f|no|n|0)$/i)
      raise ArgumentError.new("invalid value for Boolean: \"#{value}\"")
    end
  end
end