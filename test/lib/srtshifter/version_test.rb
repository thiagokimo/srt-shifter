require "test_helper"

describe SrtShifter do
	it "must have a version" do
		SrtShifter::VERSION.wont_be_nil
	end
end