require 'rails'

module GrapeOnRailsRoutes
  module RailsExt
    class GrapeRailsRoutes < Rails::Railtie
      rake_tasks do
        load 'tasks/grape.rake'
      end
    end
  end
end
