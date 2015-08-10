# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'haxe_cli_proxy/version'

Gem::Specification.new do |spec|
  spec.name          = 'haxe_cli_proxy'
  spec.version       = HaxeCliProxy::VERSION
  spec.authors       = ['k-motoyan']
  spec.email         = ['k-motoyan888@gmail.com']

  spec.summary       = %q{Haxe command line client.}
  spec.homepage      = 'https://github.com/k-motoyan/haxe_cli_proxy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
