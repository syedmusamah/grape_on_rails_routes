namespace :grape do
  desc "show API routes"
  task routes: :environment do
    grape_klasses = ObjectSpace.each_object(Class).select { |klass| klass < Grape::API }
    routes = grape_klasses.flat_map(&:routes).uniq { |r| r.route_path + r.route_method }
    method_width, path_width, version_width, desc_width = widths(routes)
    routes.each do |api|
      method = api.route_method.to_s.rjust(method_width)
      path = api.route_path.to_s.ljust(path_width)
      version = api.route_version.to_s.ljust(version_width)
      desc = api.route_description.to_s.ljust(desc_width)
      puts "     #{method}  |  #{path}  |  #{version}  |  #{desc}"
    end
  end

  def widths(routes)
    [routes.map { |r| r.route_method.try(:length) }.compact.max || 0,
     routes.map { |r| r.route_path.try(:length) }.compact.max || 0,
     routes.map { |r| r.route_version.try(:length) }.compact.max || 0,
     routes.map { |r| r.route_description.try(:length) }.compact.max || 0]
  end
end
