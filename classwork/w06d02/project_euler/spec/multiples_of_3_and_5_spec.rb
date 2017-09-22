
describe Multiples_of_3_and_5 do
	
	before(:each) do 
		@multiples = Multiples_of_3_and_5.new
	end

	it "Divide method should return true if number has no remainder when divided by the divisor" do
		expect(@multiples.divide_by?(50,5)).to be true
	end	
	
	it "Divide method should return false if number has a remainder when divided by the divisor" do
		expect(@multiples.divide_by?(61,4)).to be false
	end

	it "Compare returns true if number is a multiple of 3 and 5" do
		expect(@multiples.compare?(60)).to be true
	end

	it "Compare returns true if number is a multiple of just 3" do
		expect(@multiples.compare?(12)).to be true
	end

	it "Compare returns true if number is a multiple of just 5" do
		expect(@multiples.compare?(50)).to be true
	end

	it "Compare returns false if number is not a multiple of 3 or 5" do
		expect(@multiples.compare?(26)).to be false
	end

	it "Inputted range should get the sum of all 3 and 5 multiples inside the range" do
		expect(@multiples.loop(0,9)).to eq 23
	end
end