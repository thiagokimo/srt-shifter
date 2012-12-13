require 'optparse'

module SrtShifter
  class Options

  	OPERATIONS = ["add", "sub"]

  	attr_accessor :opts

  	def initialize()
  		self.opts = Hash.new
  	end

  	def valid_operation?
  		OPERATIONS.include? self.opts[:operation] 
  	end
  end
end