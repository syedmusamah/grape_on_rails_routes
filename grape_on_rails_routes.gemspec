$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "grape_on_rails_routes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "grape_on_rails_routes"
  s.version     = GrapeOnRailsRoutes::VERSION
  s.authors     = ["syedmusamah"]
  s.email       = ["syed@thredup.com"]
  s.summary     = "Summary of GrapeOnRailsRoutes."
  s.description = "Description of GrapeOnRailsRoutes."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.1.1"

end
