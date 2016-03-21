$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "grape_on_rails_routes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "grape_on_rails_routes"
  s.homepage    = "https://github.com/syedmusamah/grape_on_rails_routes"
  s.version     = GrapeOnRailsRoutes::VERSION
  s.authors     = ["syedmusamah"]
  s.email       = ["syed@thredup.com"]
  s.summary     = "Grape API routes"
  s.description = "View routes for all Grape API's mounted on Rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">=3.1.1", "<=4.2.5"
end
