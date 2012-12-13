require 'optparse'

module SrtShifter
  class Options

    OPERATIONS = ["ADD", "SUB"]

    options = {}
    
    ARGV.options do |opts|
      opts.banner = "Usage:  #{File.basename($PROGRAM_NAME)} [OPTIONS] input_file output_file"
      
      opts.separator ""
      opts.separator "Common Options:"

      opts.on("--operation (ADD|SUB)", String, "Type ADD to increase time or SUB to decrease time.") do |o|
        options[:operation] = o if OPERATIONS.include? o
      end

      opts.on("--time N", Float, "Time in milliseconds.") do |n|
        options[:time] = n
      end
      
      begin
        opts.parse!

        options[:input] = ARGV[0] unless ARGV[0] == nil
        options[:output] = ARGV[1] unless ARGV[1] == nil

        subtitle = SrtShifter::Subtitle.new(options)
        subtitle.shift
      rescue
        puts "Invalid arguments!"
        exit
      end
    end
  end
end