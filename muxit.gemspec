# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'muxit/version'

Gem::Specification.new do |spec|
  spec.name          = "muxit"
  spec.version       = Muxit::VERSION
  spec.authors       = ["Andrew Nordman"]
  spec.email         = ["cadwallion@gmail.com"]
  spec.description   = %q{Simplify solo development with tmux}
  spec.summary       = %q{Mux your local dev environment}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "thor"
end
