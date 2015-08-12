require 'haxe/cli/proxy/version'
require 'haxe/cli/proxy/constants'
require 'haxe/cli/proxy/error'
require 'haxe/cli/proxy/command'
require 'haxe/cli/proxy/compile_option'

module Haxe
  module Cli
    module Proxy
      raise Error::CommandNotExistsError.new unless Command.exists?
    end
  end
end
