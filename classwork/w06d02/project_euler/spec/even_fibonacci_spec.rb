describe Even_fibonacci do

	before(:each) do 
		@even_fib = Even_fibonacci.new
	end

	it "Check function should return true if number in less than 4 million" do
		expect(@even_fib.check?(200000,4000000)).to be true 
	end

	it "Check function should return true if number is 4 million" do
		expect(@even_fib.check?(4000000,4000000)).to be true 
	end

	it "Check function should return false if number is more than 4 million" do
		expect(@even_fib.check?(5000000,4000000)).to be false
	end

	it "Total is 0, num1 is equal to 1 and num2 is equal to 2 upon initialization" do
		expect(@even_fib.total).to eq 0
		expect(@even_fib.num1).to eq 1
		expect(@even_fib.num2).to eq 2
	end

	it "Divide method should return true if there is no remainder" do
		expect(@even_fib.divide_by?(20,5)).to be true 
	end

	it "Divide method should return false if there is a remainder" do
		expect(@even_fib.divide_by?(41,2)).to be false
	end

	it "Add method should add 2 numbers and return the total" do
		expect(@even_fib.add_nums(1,2)).to eq 3
	end

	it "Overide method should replace num1 with total when loop is odd" do
		@even_fib.overide(3)
		expect(@even_fib.num1).to eq @even_fib.total
	end	

	it "Overide method should replace num2 with total when loop is even" do
		@even_fib.overide(24)
		expect(@even_fib.num2).to eq @even_fib.total
	end	

	it "Even total should add the number to the total if even" do
		expect(@even_fib.even_total(1)).to be_even 
	end

	it "Fib sequence matches with array" do
		@even_fib.fib_run(13)
		expect(@even_fib.fib_nums).to match_array([1,2,3,5,8,13])
	end

end