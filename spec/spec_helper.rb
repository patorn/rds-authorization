require 'sqlite3'
require 'active_record'
require 'rds/authorization/authorization'
require 'rds/authorization/role'
require 'rds/authorization/user'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

RSpec.configure do |config|
end