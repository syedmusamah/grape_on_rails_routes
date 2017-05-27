begin
  require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task default: :spec
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

