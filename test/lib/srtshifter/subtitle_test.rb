require "test_helper"

class Fixnum
	def minute
		self * 60
	end
	alias :minutes :minute
end

describe SrtShifter do

	describe "SUBTITLE" do
		
		before(:each) do
			@options = {:operation => "ADD", :time => 10.0, :input => "test/samples/test_srt.srt", :output => "test_output.srt"}
		end

		after(:each) do
			@options = nil
		end

		describe "begin_time" do
			it "must find the begin time" do
				
				# given_time = "00:00:10,000"

				@options[:operation] = "SYNC"
				@options[:begin] = '00:00:00'
				@options[:end] = '00:00:00'
				sub = SrtShifter::Subtitle.new(@options)
				
				sub.begin_time.must_equal 20

			end
		end

		describe "end_time" do
			it "must find the end time" do
				
				# given_time = "00:00:10,000"
				@options[:operation] = "SYNC"
				@options[:begin] = '00:00:00'
				@options[:end] = '00:00:00'
				sub = SrtShifter::Subtitle.new(@options)
				
				sub.end_time.must_equal 27.8

			end
		end

		describe "new_length" do
			it "must find the new length" do
				
				# given_time = "00:00:10,000"
				@options[:operation] = "SYNC"
				@options[:begin] = '00:00:00'
				@options[:end] = '00:10:00'
				sub = SrtShifter::Subtitle.new(@options)
				
				sub.new_length.must_equal 600

			end
		end

		describe "old_length" do
			it "must find the old length" do
				
				# given_time = "00:00:10,000"
				@options[:operation] = "SYNC"
				@options[:begin] = '00:00:00'
				@options[:end] = '00:10:00'
				@options[:input] = "test/samples/test_sync_srt.srt"
				sub = SrtShifter::Subtitle.new(@options)
				
				sub.begin_time.must_equal 1*60
				sub.end_time.must_equal 4*60
				sub.old_length.must_equal 3*60

			end
		end

		describe "convert_time" do
			

			it "must sync" do
				
				# given_time = "00:00:10,000"
				@options[:operation] = "SYNC"
				@options[:begin] = '00:00:00'
				@options[:end] = '00:10:00'
				@options[:input] = "test/samples/test_sync_srt.srt"
				sub = SrtShifter::Subtitle.new(@options)

				sub.begin_time.must_equal 1.minute
				sub.end_time.must_equal 4.minutes
				sub.old_length.must_equal 180
				sub.new_length.must_equal 600
				sub.time_to_sum.must_equal -60
				sub.multiply_factor.must_equal 10/3.0

				sub.convert_time("00:01:00,000").must_equal "00:00:00,000"
				sub.convert_time("00:02:00,000").must_equal "00:03:20,000"
				sub.convert_time("00:03:00,000").must_equal "00:06:40,000"
				sub.convert_time("00:04:00,000").must_equal "00:10:00,000"

			end


			it "must sync aos" do
				
				# given_time = "00:00:10,000"
				@options[:operation] = "SYNC"
				@options[:begin] = '00:01:00'
				@options[:end] = '01:04:00'
				@options[:input] = "test/samples/aos.srt"
				sub = SrtShifter::Subtitle.new(@options)

				sub.begin_time.must_equal 14.6
				sub.end_time.must_equal 59*60 + 41 + 0.6
				sub.old_length.must_equal 3567
				sub.new_length.must_equal 3780
				("%1f" % sub.time_to_sum).to_f.must_equal 45.4
				sub.multiply_factor.must_equal 3780/3567.0

				sub.convert_time("00:00:14,600").must_equal "00:01:00,000"
				sub.convert_time("00:59:41,600").must_equal "01:04:00,000"

			end

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