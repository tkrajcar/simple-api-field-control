# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "simple-api-field-control"
  gem.homepage = "http://github.com/tkrajcar/simple-api-field-control"
  gem.license = "MIT"
  gem.summary = "A simple DSL for ActiveRecord objects to include/exclude virtual attributes/custom methods in to_json/to_xml."
  gem.description = "A simple DSL for ActiveRecord objects to include/exclude virtual attributes/custom methods in to_json/to_xml."
  gem.email = "allegro@conmolto.org"
  gem.authors = ["Tim Krajcar"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "simple-api-field-control #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Run tests with code coverage enabled"
task :coverage do
  ENV["COVERAGE"] = "true"
  Rake::Task["spec"].invoke
end