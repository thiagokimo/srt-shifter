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

				new_start_time = convert_time $1 unless $1.nil?
      			new_end_time = convert_time $2 unless $2.nil?
      			
      			new_line = "#{new_start_time} --> #{new_end_time}"
      			
						
			end

		end

		def convert_time time

			if @opts[:operation] == "SUB"
				@opts[:time] = -@opts[:time]
			end

			current_time = Time.parse(time)
			new_time = Time.at(current_time.to_f + @opts[:time])
			"#{new_time.strftime('%H:%M:%S')},#{new_time.usec/1000}"
		end
	end
end