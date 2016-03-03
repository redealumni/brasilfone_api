# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brasilfone_api/version'

Gem::Specification.new do |spec|
  spec.name          = "brasilfone_api"
  spec.version       = BrasilfoneAPI::VERSION
  spec.authors       = ["Victor Fonseca"]
  spec.email         = ["victorcel19@gmail.com"]

  spec.summary       = %q{Used to interface with Brasilfone's web API}
  spec.description   = %q{Used to interface with Brasilfone's web API}
  spec.homepage      = "https://github.com/redealumni/brasilfone_api"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "189.111.196.185"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "xmlhasher", "~> 1.0.2"
  spec.add_development_dependency "pry", "~> 0.10.3"
  spec.add_development_dependency "webmock", "~> 1.24.1"
end
