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

				time_match = line.scan(/(\d{2}:\d{2}:\d{2},\d{3}) --\> (\d{2}:\d{2}:\d{2},\d{3})/)

				new_start_time = convert_time $1
      			new_end_time = convert_time $2
      			
      			new_line = "#{new_start_time} --> #{new_end_time}"
      			puts new_line
						
			end

			# #time_lines = lines.scan(/(\d{2}:\d{2}:\d{2}\D\d{3}) --> (\d{2}:\d{2}:\d{2}\D\d{3})/)
			# time_lines = lines.scan(/\d/)

			# puts time_lines

			# #puts time_lines

			#File.open(@opts[:output], 'w') {|f| f.write("test") }

		end

		def convert_time time
			
			if @opts[:operation] == "ADD"
				Time.at(time + opts[:time])
			else
				Time.at(time - opts[:time])
			end

		end

	end
end