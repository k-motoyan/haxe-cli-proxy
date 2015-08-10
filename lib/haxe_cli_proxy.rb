require 'haxe_cli_proxy/version'
require 'haxe_cli_proxy/constants'
require 'haxe_cli_proxy/error'
require 'haxe_cli_proxy/command'
require 'haxe_cli_proxy/compile_option'

module HaxeCliProxy
  raise Error::CommandNotExistsError.new unless Command.exists?
end