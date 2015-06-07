# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traveler/version'

Gem::Specification.new do |spec|
  spec.name          = "traveler"
  spec.version       = Traveler::VERSION
  spec.authors       = ["Juan Manuel Rodulfo Salcedo"]
  spec.email         = ["jm.rodulfo.salcedo@gmail.com"]

  spec.summary       = %q{Traveler Salesman Problem}
  spec.homepage      = "git@github.com:Juanchote/traveler.git"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "thor"
end
