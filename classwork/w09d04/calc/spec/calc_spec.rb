
describe Calculator do

	before(:each) do
		@calc = Calculator.new
	end

	it "should have an add method" do
		expect(@calc).to respond_to (:add)
	end

	it "should have an minus method" do
		expect(@calc).to respond_to (:minus)
	end

	it "should have an divide method" do
		expect(@calc).to respond_to (:divide)
	end

	it "should have an multiply method" do
		expect(@calc).to respond_to (:multiply)
	end

	it "should add two numbers" do
		expect(@calc.add(2,2)).to eq 4
	end

	it "should subtract two numbers" do
		expect(@calc.minus(2,2)).to eq 1
	end

	it "should divde two numbers" do
		expect(@calc.divide(2,2)).to eq 2
	end

	it "should multiply two numbers" do
		expect(@calc.multiply(2,2)).to eq 4
	end

end
