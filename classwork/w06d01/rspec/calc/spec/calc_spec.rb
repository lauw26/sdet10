# the tests to be runned for the Calulator class
describe Calculator do 
	# Creates calc objects first
	before(:each) do 
		@calc = Calculator.new
	end
	
	it "should have an add method" do
		# checks if calc has add method
		expect(@calc).to respond_to(:add)
	end 

	it "should have a subtract method" do
		expect(@calc).to respond_to(:minus)
	end

	it "should have a multiple method" do
		expect(@calc).to respond_to(:multiply)
	end

	it "should have a divide method" do
		expect(@calc).to respond_to(:divide)
	end

	it "should add two numbers" do
		expect(@calc.add(1,2)).to eql 1+2  
	end 

	it "should subtract two numbers" do
		expect(@calc.minus(1,2)).to eql 1-2 
	end

	it "should multiple two numbers" do
		expect(@calc.multiply(1,2)).to eql 1*2 
	end

	it "should divide two numbers" do
		expect(@calc.divide(1,2)).to eql 1/2 
	end

end