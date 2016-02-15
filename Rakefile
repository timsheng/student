require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
  # t.cucumber_opts = "features --format pretty"
end

Cucumber::Rake::Task.new(:pretty_face) do |t|
  t.profile = 'pretty_face'
end



task :default => :features
