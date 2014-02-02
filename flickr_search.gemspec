# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flickr_search/version'

Gem::Specification.new do |spec|
  spec.name          = "flickr_search"
  spec.version       = FlickrSearch::VERSION
  spec.authors       = ["Raman Sinha"]
  spec.email         = ["velobuff@gmail.com"]
  spec.summary       = %q{Simple photo search for Flickr}
  spec.description   = %q{Search photos on Flickr using your Flickr developer API credentials.}
  spec.homepage      = "http://github.com/velobuff/flickr_search"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.9.0"
#  spec.add_runtime_dependency "active_support" "~> 4.0.2"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec" , "~> 2.14.1"

end
