# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'strshifter/version'

Gem::Specification.new do |gem|
  gem.name          = "strshifter"
  gem.version       = Strshifter::VERSION
  gem.authors       = ["Thiago Rocha"]
  gem.email         = ["kimobr@gmail.com"]
  gem.description   = %q{Shifts STR Subtitles}
  gem.summary       = %q{It fixes the timing of a given SubRip file}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
