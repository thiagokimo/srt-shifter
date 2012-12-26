require "test_helper"

describe SrtShifter do

	

	describe "SUBTITLE" do
		
		before(:each) do
			@options = {:operation => "ADD", :time => 10.0, :input => "../../samples/test_srt.srt", :output => "test_output.srt"}
		end

		describe "convert_time" do
			
			it "must add 2.5 seconds" do
				
				sub = SrtShifter::Subtitle.new(@options)
				@options[:operation] = "ADD"
				@options[:time] = 2.5

				time = "00:00:10,000"
				sub.convert_time(time).must_equal "00:00:12,500"

			end

			it "must subtract 5.3 seconds" do
				
				sub = SrtShifter::Subtitle.new(@options)
				@options[:operation] = "SUB"
				@options[:time] = 5.3

				time = "00:00:10,000"
				sub.convert_time(time).must_equal "00:00:04,700"

			end

		end

	end
end