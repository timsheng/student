require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

task :default => :features


namespace :features do
  Cucumber::Rake::Task.new(:watir_webdriver,'Run features with Watir') do |t|
    t.profile = 'watir'
  end

  Cucumber::Rake::Task.new(:selenium_webdriver,'Run features with Selenium') do |t|
    t.profile = 'selenium'
  end

  desc 'Run all features using watir and selenium'
  task :all => [:watir_webdriver, :selenium_webdriver]
end