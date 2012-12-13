require 'optparse'

module SrtShifter
  class Options

    OPERATIONS = ["ADD", "SUB"]

    options = {}
    
    ARGV.options do |opts|
      opts.banner = "Usage:  #{File.basename($PROGRAM_NAME)} [OPTIONS] OTHER_ARGS"
      
      opts.separator ""
      opts.separator "Specific Options:"
      
      opts.separator "Common Options:"
      
      opts.on( "-h", "--help",
               "Show this message." ) do
        puts opts
        exit
      end

      opts.on("--operation N", String, "Time in milliseconds.") do |o|
        options[:operation] = o if OPERATIONS.include? o
        puts options[:operation]
      end

      opts.on("--time N", Float, "Time in milliseconds.") do |n|
        options[:time] = n
      end
      
      begin
        opts.parse!

        options[:input] = ARGV[0] unless ARGV[0] == nil
        options[:output] = ARGV[1]

        subtitle = SrtShifter::Subtitle.new(options)
        subtitle.shift
      rescue
        puts "Invalid arguments!"
        puts ARGV
        exit
      end
    end
  end
end