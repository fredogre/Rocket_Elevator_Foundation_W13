$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails_admin_greetings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_greetings"
  s.version     = RailsAdminGreetings::VERSION
  s.authors     = ["Patrick Thibault"]
  s.email       = ["tiboclan@gmail.com"]
  s.homepage    = "https://github.com/sferik/rails_admin/wiki/Custom-action"
  s.summary     = "Summary of RailsAdminGreetings."
  s.description = "Description of RailsAdminGreetings."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
end
