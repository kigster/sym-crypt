require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'base64'
require 'openssl'
require 'rspec/its'

require 'sym/crypt'

require_relative 'support/contexts'
require_relative 'support/shared_examples'

RSpec.configure do |spec|
  #
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
