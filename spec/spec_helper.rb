require File.expand_path(
    File.join(File.dirname(__FILE__), %w[.. lib caching_matcher]))

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path(File.join(File.dirname(__FILE__),'mock_app','config','environment'))

require 'spec/rails'

Spec::Runner.configure do |config|
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.include(CachingMatcher)
  config.before(:each) { ActionController::Base.cache_store.clear }
  
end

