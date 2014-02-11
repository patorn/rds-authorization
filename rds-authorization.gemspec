# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rds/authorization/version'

Gem::Specification.new do |spec|
  spec.name          = "rds-authorization"
  spec.version       = Rds::Authorization::VERSION
  spec.authors       = ["Patorn Utenpattanun"]
  spec.email         = ["patorn.u@gmail.com"]
  spec.description   = %q{Add a method to check a user permission}
  spec.summary       = %q{Add a method to check a user permission}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rails', '>= 4.0'
  spec.add_runtime_dependency 'rails-api'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "pg"
end
