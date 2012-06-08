# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tracer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Juan Wajnerman"]
  gem.email         = ["jwajnerman@manas.com.ar"]
  gem.description   = %q{Logging system to trace distributed and structured events}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tracer"
  gem.require_paths = ["lib"]
  gem.version       = Tracer::VERSION
  gem.add_dependency('uuid')
end
