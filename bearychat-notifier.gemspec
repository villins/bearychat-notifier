# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bearychat-notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "bearychat-notifier"
  spec.version       = Bearychat::Notifier::VERSION
  spec.authors       = ["villins"]
  spec.email         = ["linshao512@gmail.com"]
  spec.summary       = %q{A simple wrapper for posting to bearychat channels}
  spec.description   = %q{A simple wrapper for posting to bearychat channels}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '~> 3.3.0'
end
