# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sacloudfs/version'

Gem::Specification.new do |spec|
  spec.name          = 'sacloudfs-rb'
  spec.version       = Sacloudfs::VERSION
  spec.authors       = ['Shingo Kawamura']
  spec.email         = ['blp1526@gmail.com']

  spec.summary       = 'A fuse filesystem for SAKURA Cloud'
  spec.description   = 'A fuse filesystem for SAKURA Cloud'
  spec.homepage      = 'https://github.com/blp1526/sacloudfs-rb'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rfusefs', '~> 1.0.3'
  spec.add_dependency 'faraday', '~> 0.10.0'
  spec.add_dependency 'activesupport', '~> 5.0.0.1'
  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_development_dependency 'webmock', '~> 2.3.1'
end
