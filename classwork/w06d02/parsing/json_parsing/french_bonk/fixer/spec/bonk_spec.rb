
describe Bonk do

	before(:all) do 
		@bonk = Bonk.new
		@bonk.get_file('bonk.json')
		@date_array = @bonk.file['date'].split("-")
	end

	it "Check if json contains the keys rates, date and base" do
		expect(@bonk.file.keys).to match_array(["base","date","rates"])
	end

	it "Check data type of base to be a string" do
		expect(@bonk.file['base']).to be_a(String)
	end

	it "Checks that the base is 3 letters long" do
		expect(@bonk.file['base'].length).to eql 3
	end

	it "Checks date is 8 characters long" do
		expect(@bonk.file['date'].gsub("-","").length).to eql 8
	end

	it "Checks if the year is 4 integers long" do
		expect(@date_array[0].to_i.digits.count).to eql 4
	end

	it "Checks if length of month is appropiate" do
		expect(@date_array[1].length).to eql 2
	end

	it "Checks if month is between 1 and 12" do
		expect(@date_array[1].to_i).to be < 12 
		expect(@date_array[1].to_i).to be > 1
	end

	it "Checks if length of day is appropiate" do
		expect(@date_array[2].length).to eql 2
	end

	it "Checks if day is between 1 and 31" do
		expect(@date_array[2].to_i).to be < 31 
		expect(@date_array[2].to_i).to be > 1
	end

	it "Checks if amount of rates to be 31" do
		expect(@bonk.file['rates'].length).to eql 31
	end

	it "Checks if rates names are 3 characters long and the value is a number" do
		@bonk.file['rates'].each do |rate|
			expect(rate[0]).to be_a(String) 
			expect(rate[0].length).to eq 3
			expect(rate[1]).to be_kind_of(Numeric)
		end
	end


end