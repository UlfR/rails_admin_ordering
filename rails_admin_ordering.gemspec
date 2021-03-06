$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_ordering/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_ordering"
  s.version     = RailsAdminOrdering::VERSION
  s.authors     = ["Ivan Grunev"]
  s.email       = ["ivan.grunev@netcook.org"]
  s.homepage    = "http://netcook.org"
  s.summary     = "RailsAdmin plugin for manage models ordering"
  s.description = "RailsAdmin plugin for manage models ordering"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "rails_admin", "~> 0.4.9"

  s.add_development_dependency "sqlite3"
end
