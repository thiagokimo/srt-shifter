require 'time'

module SrtShifter
	class Subtitle
		
		def initialize(options)
			@opts = options
		end

		def shift

			lines = IO.readlines(@opts[:input])

			File.open(@opts[:output], 'w') {|f| f.write("test") }

		end

	end
end