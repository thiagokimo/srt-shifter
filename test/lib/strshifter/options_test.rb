require "test_helper"

describe StrShifter do
	
	describe "OPTIONS" do

		describe "mandatory arguments" do
			
			describe "operation" do
				
				it "ADD" do
					options = StrShifter::Options.new
					options.opts[:operation] = :add
					options.valid_operation?.must_equal true
				end

				it "SUB" do
					options = StrShifter::Options.new
					options.opts[:operation] = :sub
					options.valid_operation?.must_equal true
				end

				it "can't accept params different from ADD or SUB" do
					options = StrShifter::Options.new
					options.opts[:operation] = :banana_split
					options.valid_operation?.must_equal false
				end
			end

			describe "time" do
				
			end

			describe "files" do
				
			end		

		end

		





		# describe "--operation" do
			
		# 	it "add"

		# 	it "sub"

		# 	it "invalid operations"
		# end

		# describe "--time" do
			
		# 	it "start with '--time'"

		# 	it "get a value in seconds"
		# end

		# describe "files" do
			
		# 	it "has 2 params"

		# 	it "start with input file name"

		# 	it "ends with output file name"
		# end

	end
end