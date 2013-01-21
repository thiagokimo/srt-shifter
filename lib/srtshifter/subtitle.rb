require 'time'

module SrtShifter
	class Subtitle
		
		def initialize(options)
			@opts = options
		end

		def shift

			start_time = Time.now

			output_file = File.open(@opts[:output], 'w')

			lines = IO.readlines(@opts[:input])

			lines.each do |line|

				time_line = line.force_encoding("iso-8859-1")
				time_match = time_line.scan(/(\d{2}:\d{2}:\d{2},\d{3}) --\> (\d{2}:\d{2}:\d{2},\d{3})/)
        time_match.flatten!
				
				if time_match[0].nil? || time_match[1].nil?
					output_file.write(line)
				else
					new_start_time = convert_time(time_match[0])
      				new_end_time = convert_time(time_match[1])
      				new_line = "#{new_start_time} --> #{new_end_time}\n"

      				output_file.write(new_line)
				end
			end

			end_time = Time.now

			puts "\nFile created with success!"
			puts "Elapsed time: #{end_time-start_time} seconds."
		end

    def convert_time(time)
      time_diff = time_in_seconds(@opts[:time])
      if @opts[:operation] == "SUB" and time_diff > 0
        time_diff *= -1
      end

      current_time = Time.parse(time)
      new_time = Time.at(current_time.to_f + time_diff)
      "#{new_time.strftime('%H:%M:%S')},#{sprintf("%.3d",new_time.usec/1000)}"
    end

    private

    def time_in_seconds(time_string)
      return time_string if time_string.kind_of?(Numeric)

      times = time_string.scan(/(\d{2}):(\d{2}):(\d{2}).(\d{3})/)
      times.flatten!
      times.map!(&:to_i)
      times[3]/1_000.0 + times[2] + 60*(times[1] + times[0]*60)
    end
  end
end
