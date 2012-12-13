require "test_helper"

describe SrtShifter do
	
	describe "OPTIONS" do

		describe "mandatory arguments" do

			describe "operation argument" do
				
				it "--operation"

				it "-o"
			end
			
			describe "operation param" do
				
				it "has to come right after the operation argument"

				it "ADD" do
					options = SrtShifter::Options.new
					options.opts[:operation] = :add
					options.valid_operation?.must_equal true
				end

				it "SUB" do
					options = SrtShifter::Options.new
					options.opts[:operation] = :sub
					options.valid_operation?.must_equal true
				end

				it "can't accept things different from ADD or SUB" do
					options = SrtShifter::Options.new
					options.opts[:operation] = :banana_split
					options.valid_operation?.must_equal false
				end
			end

			describe "time argument" do
				it "--time"
				it "-t"
			end

			describe "time params" do
				
				it "has to come right after the time argument"

				it "must be a Float"

			end

			describe "file params" do
				
				it "must start with a input file"

				it "must end with the output file"
			end		
		end
	end
end