require 'time'

module SrtShifter
	class Subtitle
		
		def initialize(options)
			@opts = options
		end

		def shift

			input_file = File.open(@opts[:input], "r")

			while (line = input_file.gets)
            
	            line.scan(/^([0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}) --> ([0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3})/) { |match|  
	              
	              match.each { |e| 

	              	puts Time.parse(e)
	              	puts Time.parse(e).usec

	              }

	            }
	            
            end

            input_file.close

		end


		def add_time
			input_file = @opts
		end

		def sub_time
			
		end

	end
end