require 'optparse'

module SrtShifter
  class Options

    operations = ["ADD", "SUB"]

    options = {}
    
    ARGV.options do |opts|

      opts.banner = "Usage:  #{File.basename($PROGRAM_NAME)} [OPTIONS] input_file output_file"
      
      opts.separator ""
      opts.separator "Common Options:"

      opts.on("-o","--operation (ADD|SUB)", String, "Type ADD to increase time or SUB to decrease time.") do |o|
        options[:operation] = o.upcase 
      end

      opts.on("-t","--time (VALUE)", Float, "Time in milliseconds.") do |n|
        options[:time] = n
      end

      opts.on_tail('-h', '--help', 'Show this help message.') do
        puts(opts)
        exit(0)
      end
      
      opts.parse!

      begin
        raise "Operation option is missing" if options[:operation].nil?
        raise "Time option is missing" if options[:time].nil?
        
        raise "Input file is missing" if ARGV[0].nil?
        options[:input] = ARGV[0]
        
        raise "Output file is missing" if ARGV[1].nil?
        options[:output] = ARGV[1]

        subtitle = SrtShifter::Subtitle.new(options)
        subtitle.shift

      rescue Exception => ex
        puts "#{ex.message}. Please use -h or --help for usage."
        exit(1)
      end

      # begin
      #   raise "Unknown option(s) #{options.join(', ')}" if options.empty?
      # rescue Exception => e
      #   puts "#{ex.message()}. Please use -h or --help for usage."
      #   exit(1)
      # end
      
      # begin

      #   opts.parse! ARGV

      #   # raise OptionParser::MissingArgument if options[:operation].nil? || options[:time].nil?

      #   # options[:input] = ARGV[0] unless ARGV[0] == nil
      #   # options[:output] = ARGV[1] unless ARGV[1] == nil

      #   # subtitle = SrtShifter::Subtitle.new(options)
      #   # subtitle.shift
      # rescue 
      #   # $stderr.print $!
      #   # puts options
      #   # puts "\n" 
      #   # puts opts
      #   # #exit
      # end
    end
  end
end