# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'srtshifter/version'

Gem::Specification.new do |gem|
  gem.name          = "srtshifter"
  gem.version       = SrtShifter::VERSION
  gem.authors       = ["Thiago Rocha"]
  gem.email         = ["kimo@kimo.io"]
  gem.description   = %q{Shifts STR Subtitles}
  gem.summary       = %q{It fixes the timing of a given SubRip file}
  gem.homepage      = "http://thiagokimo.github.com/srt-shifter"

  gem.license = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rake'
end
