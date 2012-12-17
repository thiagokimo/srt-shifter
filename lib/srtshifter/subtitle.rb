require 'time'

module SrtShifter
	class Subtitle
		
		def initialize(options)
			@opts = options
		end

		def shift

			output_file = File.open(@opts[:output], 'w')

			lines = IO.readlines(@opts[:input])


			lines.each do |line|

				time_match = line.scan(/(\d{2}:\d{2}:\d{2},\d{3})/)

				# if time_line.size > 0
				# 	output_file.write("MUDOU\n")
				# else
				# 	output_file.write(line)
				# end
						
			end

			# #time_lines = lines.scan(/(\d{2}:\d{2}:\d{2}\D\d{3}) --> (\d{2}:\d{2}:\d{2}\D\d{3})/)
			# time_lines = lines.scan(/\d/)

			# puts time_lines

			# #puts time_lines

			#File.open(@opts[:output], 'w') {|f| f.write("test") }

		end

	end
end