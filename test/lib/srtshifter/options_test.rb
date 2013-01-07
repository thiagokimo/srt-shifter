# require File.expand(__FILE__, "../../test_helper")
# require File.expand_path('../../../test_helper', __FILE__)
require "test_helper"

describe SrtShifter do

	describe "Options" do
		
		describe "validate_args" do

			before(:each) do
				@add_args = {:operation => "ADD", :time => 10.0, :input => "test/samples/test_srt.srt", :output => "test_output.srt"}
				@sync_args = {:operation => "SYNC", :begin => '00:01:00', :end => '01:00:00', :input => "test/samples/test_srt.srt", :output => "test_output.srt"}
			end

			after(:each) do
				@args = nil
			end
			
			it "raise error when get none operation option" do
				
				args = ""
				opts = SrtShifter::Options.new args

				lambda { opts.validate_args }.must_output("Operation option is missing. Please use -h or --help for usage.\n", nil)

			end

			it "raise error when operation is unknown" do
				
				opts = SrtShifter::Options.new ""
				opts.options[:operation] = "bla"

				lambda { opts.validate_args }.must_output("Unknown operation: bla. Please use -h or --help for usage.\n", nil)				
			end

			it "must accept lowercase add args" do

				opts = SrtShifter::Options.new "test/samples/test_srt.srt test_output.srt"
				opts.options = @add_args
				opts.options[:operation] = "sub"

				lambda { opts.validate_args }.must_be_silent				
			end

			it "must accept lowercase sync args" do

				opts = SrtShifter::Options.new "test/samples/test_srt.srt test_output.srt"
				opts.options = @sync_args
				opts.options[:operation] = "sub"

				lambda { opts.validate_args }.must_be_silent				
			end


			it "raise error when get none time option"

			it "raise error when get none time value"

			it "raise error when get none input file path" 

			it "raise error when get none output file path"

		end

	end

end