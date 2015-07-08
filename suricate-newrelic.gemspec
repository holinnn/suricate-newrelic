lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'suricate/newrelic/version'

Gem::Specification.new do |spec|
  spec.name          = 'suricate-newrelic'
  spec.version       = Suricate::Newrelic::VERSION
  spec.authors       = ['Aurélien AMILIN']
  spec.email         = ['aurelien.amilin@gmail.com']

  spec.summary       = %q{Newrelic plugin for Suricate}
  spec.homepage      = 'https://github.com/holinnn/suricate-newrelic'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z -- lib/`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'suricate', '~> 0.0'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'byebug', '~> 5.0'
  spec.add_development_dependency 'simplecov', '~> 0.10.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.7'
end
