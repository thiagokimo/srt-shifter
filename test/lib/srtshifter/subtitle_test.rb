require "test_helper"

describe SrtShifter do

	describe "SUBTITLE" do
		
		before(:each) do
			@options = {:operation => "ADD", :time => 10.0, :input => "test/samples/test_srt.srt", :output => "test_output.srt"}
		end

		after(:each) do
			@options = nil
		end

		describe "convert_time" do
			
			it "must add 2.5 seconds to a given time" do
				
				given_time = "00:00:10,000"

				@options[:operation] = "ADD"
				@options[:time] = 2.5
				sub = SrtShifter::Subtitle.new(@options)
				
				sub.convert_time(given_time).must_equal "00:00:12,500"

			end

			it "must subtract 5.3 seconds to a given time" do

				given_time = "00:00:10,000"

				@options[:operation] = "SUB"
				@options[:time] = 5.3
				sub = SrtShifter::Subtitle.new(@options)

				sub.convert_time(given_time).must_equal "00:00:04,700"

			end

		end

		describe "shift" do
			
			it "must generate a new srt file" do
				sub = SrtShifter::Subtitle.new(@options)
				sub.shift
				File.exist?(@options[:output]).must_equal true
			end

		end

	end
end
