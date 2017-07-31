# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sym/crypt/version'

Gem::Specification.new do |spec|
  spec.name          = 'sym-crypt'
  spec.version       = Sym::Crypt::VERSION
  spec.authors       = ['Konstantin Gredeskoul']
  spec.email         = %w(kigster@gmail.com)

  spec.summary       = %q{Base encryption/decryption core of the encryption app Sym. If you need simple convenience wrappers around symmetric encryption provided by OpenSSL with sensible defaults, this gem is for you. If you require a CLI tool, please take a look at the gem 'sym'.}

  spec.description   = Sym::Crypt::DESCRIPTION

  spec.homepage      = 'https://github.com/kigster/sym-crypt'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.2'

  #spec.add_dependency 'activesupport'
  #spec.add_dependency 'highline', '~> 1.7'
  #spec.add_dependency 'coin', '~> 0.1.8'
  #spec.add_dependency 'dalli', '~> 2.7'

  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'irbtools'
  spec.add_development_dependency 'bundler', '~> 1'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'yard'
end
