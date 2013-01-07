require 'time'
require 'date'

module SrtShifter
	class Subtitle
		
		def lines
			@lines ||= IO.readlines(@opts[:input])
		end

		def initialize(options)
			@opts = options
		end

		def get_secs time_string
			("%5.3f" % (Time.parse(time_string).to_f - Date.today.to_time.to_f)).to_f
		end

		def begin_time

			lines.each do |line|

				time_line = line.force_encoding("iso-8859-1")
				time_match = time_line.scan(/(\d{2}:\d{2}:\d{2},\d{3}) --\> (\d{2}:\d{2}:\d{2},\d{3})/)
				
				next if $1.nil? && $2.nil?
				return get_secs($1)
			end
		end

		def end_time

			lines.reverse.each do |line|

				time_line = line.force_encoding("iso-8859-1")
				time_match = time_line.scan(/(\d{2}:\d{2}:\d{2},\d{3}) --\> (\d{2}:\d{2}:\d{2},\d{3})/)
				
				next if $1.nil? && $2.nil?
				return get_secs($2)
			end

		end

		def shift
			start_time = Time.now
			output_file = File.open(@opts[:output], 'w')

			lines.each do |line|

				time_line = line.force_encoding("iso-8859-1")
				time_match = time_line.scan(/(\d{2}:\d{2}:\d{2},\d{3}) --\> (\d{2}:\d{2}:\d{2},\d{3})/)
				
				if $1.nil? && $2.nil?
					output_file.write(line)
				else
					new_start_time = convert_time $1 
					new_end_time = convert_time $2 
					new_line = "#{new_start_time} --> #{new_end_time}\n"

					output_file.write(new_line)
				end
			end

			end_time = Time.now

			puts "\nFile created with success!"
			puts "Elapsed time: #{end_time-start_time} seconds."
		end

		def old_length
			@old_length ||= end_time - begin_time
		end

		def new_length
			@new_length ||= new_end_time.to_f - new_begin_time.to_f
		end

		def new_begin_time
			@new_begin_time ||= get_secs @opts[:begin]
		end

		def new_end_time
			@new_end_time ||= get_secs @opts[:end]
		end

		def time_to_sum
			@time_to_sum ||= new_begin_time - begin_time
		end

		def multiply_factor
			@multiply_factor ||= new_length / old_length
		end

		def convert_time time
			current_time = Time.parse(time) - Date.today.to_time
			new_time = case @opts[:operation]
			when "SUB", "ADD"
				@opts[:time] = -@opts[:time] if @opts[:operation] == "SUB" and @opts[:time] > 0
				Time.at(current_time.to_f + @opts[:time] + 60*60*3)
			when "SYNC"
				fact = ((current_time.to_f - begin_time.to_f) * multiply_factor) + new_begin_time.to_f
				Time.at(fact + 60*60*3)
			end

			"#{new_time.strftime('%H:%M:%S')},#{sprintf("%.3d",new_time.usec/1000)}"
		end
	end
end