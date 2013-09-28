# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multidispatch_dsl/version'

Gem::Specification.new do |spec|
  spec.name          = "multidispatch_dsl"
  spec.version       = MultidispatchDSL::VERSION
  spec.authors       = ["Sergey Pchelincev"]
  spec.email         = ["jalkoby91@gmail.com"]
  spec.description   = %q{Add mutlti dispatch functionality to Ruby}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.0.0"
end
