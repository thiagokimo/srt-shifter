require "bundler/setup"
Bundler.setup

require 'minitest/autorun'

require 'minitest/pride'
require File.expand_path('../../lib/srtshifter.rb', __FILE__)
require 'coveralls'

Coveralls.wear!
