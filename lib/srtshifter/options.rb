require 'optparse'

module SrtShifter
  class Options

    attr_accessor :options

    def initialize(args)
      @arguments = args

      @operations = ["ADD", "SUB"]

      @options = {}
    end

    def parse_options
      @arguments.options do |opts|

        opts.banner = "Usage:  #{File.basename($PROGRAM_NAME)} [OPTIONS] input_file output_file"
        
        opts.separator ""
        opts.separator "Common Options:"

        opts.on("-o","--operation (ADD|SUB)", String, "Type ADD to increase time or SUB to decrease time.") do |o|
          @options[:operation] = o.upcase
        end

        opts.on("-t","--time (VALUE)", Float, "Time in milliseconds.") do |n|
          @options[:time] = n
        end

        opts.on_tail('-h', '--help', 'Show this help message.') do
          puts(opts)
          # exit(0)
        end
        
        opts.parse!
      end
    end

    def validate_args
      begin

          raise "Operation option is missing" if @options[:operation].nil?
          raise "Unknown operation: #{@options[:operation]}" unless @operations.include? @options[:operation]

          raise "Time option is missing" if @options[:time].nil?
                    
          raise "Input file is missing" if @arguments[0].nil?
          @options[:input] = @arguments[0]
          
          raise "Output file is missing" if @arguments[1].nil?
          @options[:output] = @arguments[1]

        rescue Exception => ex
          puts "#{ex.message}. Please use -h or --help for usage."
          # exit(1)
        end
    end
  end
end