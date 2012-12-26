require "srtshifter/subtitle"
require "srtshifter/options"
require "srtshifter/version"
require "srtshifter/shifter"

shifter = SrtShifter::Shifter.new(ARGV)
shifter.execute