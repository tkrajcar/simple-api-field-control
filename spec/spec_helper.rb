$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'json_spec'
require 'nokogiri'
require 'simple-api-field-control'
require 'simplecov'
require 'active_record'
require 'active-record-setup'

SimpleCov.start if ENV["COVERAGE"]

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include JsonSpec::Helpers
end
