require 'grape_on_rails_routes/rails_ext'

class GrapeRailsRoutes < Rails::Railtie
  rake_tasks do
    Dir[File.join(File.dirname(__FILE__), 'rails/tasks/*.rake')].each { |f| load f }
  end
end
