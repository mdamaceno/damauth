$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "damauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "damauth"
  s.version     = Damauth::VERSION
  s.authors     = ["Marco Damaceno"]
  s.email       = ["maadamaceno@gmail.com"]
  s.homepage    = "http://marcodamaceno.com.br"
  s.summary     = "Summary of Damauth."
  s.description = "Description of Damauth."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
