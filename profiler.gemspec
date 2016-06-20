# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'profiler/version'

Gem::Specification.new do |spec|
  spec.name          = "profiler"
  spec.version       = Profiler::VERSION
  spec.authors       = ["Andre Possebom"]
  spec.email         = ["me@andrepossebom.com"]

  spec.summary       = %q{This gem process a specific CSV file and generate a report about phone_number information.}
  spec.description   = %q{This gem process a specific CSV file and generate a report about phone_number information, like local and longer callings, SMS and internet data used.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["profile"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  # Gem to process CSV file
  spec.add_development_dependency "smarter_csv", "~> 1.1.0"
end
