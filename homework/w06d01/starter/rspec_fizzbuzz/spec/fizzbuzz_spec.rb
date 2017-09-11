require 'fizzbuzz'

describe Fizzbuzz do

	before(:each) do 
		@fizzbuzz = Fizzbuzz.new
	end

	it "Should have a loop method" do
		# checks if fizzbuzz contains looping
		expect(@fizzbuzz).to respond_to(:loop)
	end

	it "Loop should return an array filled with 100 items" do
		# checks length of array
		expect(@fizzbuzz.nums_array.length).to eq 100
	end

	it "Should contain a dividable by 3 method" do
		expect(@fizzbuzz).to respond_to(:multiple_of_three)
	end

	it "Return true if number is a multiple of 3" do
		expect(@fizzbuzz.multiple_of_three(66)).to be true 
	end

	it "Return false if number is not a multiple of 3" do
		expect(@fizzbuzz.multiple_of_five(17)).to be false 
	end

	it "Should contain a dividable by 5 method" do
		expect(@fizzbuzz).to respond_to(:multiple_of_five)
	end

	it "Return true if number is a multiple of 5" do
		expect(@fizzbuzz.multiple_of_five(10)).to be true 
	end

	it "Return false if number is not a multiple of 5" do
		expect(@fizzbuzz.multiple_of_five(14)).to be false 
	end

	it "Should contain comparison method" do
		expect(@fizzbuzz).to respond_to(:compare) 
	end

	it "Compare should return Fizzbuzz when entered with a multiple of 3 and 5" do
		expect(@fizzbuzz.compare(15)).to eq("Fizzbuzz")
	end

	it "Compare should return Fizz when entered with a multiple of 3" do
		expect(@fizzbuzz.compare(12)).to eq("Fizz")
	end

	it "Compare should return Buzz when entered with a multiple of 5" do
		expect(@fizzbuzz.compare(35)).to eq("Buzz")
	end

	it "Compare should return a integer when entered with a multiple of not 3 or 5" do
		expect(@fizzbuzz.compare(26)).to be_a(Integer)
	end

	it "Compares the desired output up to 15 is the same as wahat is contained in array" do
		expected_combination = [1,2,"Fizz",4,"Buzz","Fizz",7,8,"Fizz","Buzz",11,"Fizz",13,14,"Fizzbuzz"]
		expect(@fizzbuzz.nums_array.take(15)).to match_array(expected_combination)
	end

end

