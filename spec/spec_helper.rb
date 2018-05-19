require "bundler"
Bundler.setup :default, :development, :test

require "rack/test"
require "omniauth/pam"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
