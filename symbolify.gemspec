# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/symbolify/version"

Gem::Specification.new do |gem|
  gem.name          = "symbolify"
  gem.version       = Symbolify::VERSION
  gem.summary       = "Represent arbitrary code points in the terminal"
  gem.description   = "Safely print all code points from Unicode or single-byte encodings"
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["hi@ruby.consulting"]
  gem.homepage      = "https://github.com/janlelis/symbolify"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.0"
  gem.add_dependency "characteristics", ">= 0.8", "< 2.0"
end
