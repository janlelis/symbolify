# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/symbolify/version"

Gem::Specification.new do |gem|
  gem.name          = "symbolify"
  gem.version       = Symbolify::VERSION
  gem.summary       = "Represent arbitrary codepoints in the terminal."
  gem.description   = "Safely print all codepoints from Unicode and single-byte encodings."
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["mail@janlelis.de"]
  gem.homepage      = "https://github.com/janlelis/symbolify"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = "~> 2.0"
  gem.add_dependency "characteristics", "~> 0.8"
end
