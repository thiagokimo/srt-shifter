module SrtShifter
	class Shifter
		
		def initialize(args)
			@arguments = args
			@opts = SrtShifter::Options.new(@arguments)
			@subtitle = subtitle = SrtShifter::Subtitle.new(@opts.options)
		end

		def execute
			@subtitle.shift if parsed_options? and valid_args?
		end

		protected
		def parsed_options?
			@opts.parse_options
		end

		def valid_args?
			@opts.validate_args
		end

	end
end