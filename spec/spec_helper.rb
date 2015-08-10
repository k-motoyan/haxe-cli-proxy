require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'haxe_cli_proxy'
