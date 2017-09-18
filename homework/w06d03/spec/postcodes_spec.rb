include Postcodes

describe SinglePostcode do

	before(:all) do 
		@ran_postcode = Postcodes.random_postcodes(1)[0]
		@one_postcode = Postcodes::SinglePostcode.new(@ran_postcode.postcode)
	end

	it "Expects status from json to be 200" do
		expect(@one_postcode.get_single_body['status']).to eq 200
	end

	it "Expects postcode to a string" do
		expect(@one_postcode.get_single_body['result']['postcode']).to be_a(String)
	end

	it "Expects postcode to be 6 to 8 characters long" do
		expect(@one_postcode.get_single_body['result']['postcode'].delete(' ').length).to be >= 6
		expect(@one_postcode.get_single_body['result']['postcode'].delete(' ').length).to be <= 8
	end

	it "Expects quality to be an integer" do
		expect(@one_postcode.get_single_body['result']['quality']).to be_a(Integer)
	end

	it "Expects quality to be ranged from 1 and 9" do
		expect(@one_postcode.get_single_body['result']['quality']).to be >= 1
		expect(@one_postcode.get_single_body['result']['quality']).to be <= 9
	end

	it "Expects country to be a string" do
		expect(@one_postcode.get_single_body['result']['country']).to be_a(String)
	end

	it "Expects longitude and latitude to be a float" do
		expect(@one_postcode.get_single_body['result']['longitude']).to be_a(Float)
		expect(@one_postcode.get_single_body['result']['latitude']).to be_a(Float)
	end

	it "Expects longitude and latitude from both APIs to match up to 4 dp" do
		expect(@one_postcode.get_single_body['result']['longitude'].round(4)).to eq @ran_postcode.longitude.round(4)
		expect(@one_postcode.get_single_body['result']['latitude'].round(4)).to eq @ran_postcode.latitude.round(4)
	end

	it "Expects outward code to be 2 to 4 characters long and a string" do
		expect(@one_postcode.get_single_body['result']['outcode']).to be_a(String)
		expect(@one_postcode.get_single_body['result']['outcode'].length).to be <= 4
		expect(@one_postcode.get_single_body['result']['outcode'].length).to be >= 2
	end

	it "Expects inward code to be 3 characters long and a string" do
		expect(@one_postcode.get_single_body['result']['incode']).to be_a(String)
		expect(@one_postcode.get_single_body['result']['incode'].length).to eq 3
	end

end

describe MultiplePostcode do

	before(:all) do 
		@ran_postcode = Postcodes.random_postcodes(2)
		@postcodes = []
		@ran_postcode.each do |post|
			@postcodes << post.postcode
		end
		@multiple_postcode_body =  Postcodes::MultiplePostcode.new(@postcodes).get_multiple_body
	end

	it "Expects status from json to be 200" do
		expect(@multiple_postcode_body['status']).to eq 200
	end

	it "Expects postcode to a string" do
		@multiple_postcode_body['result'].each do |outcome| 
			expect(outcome['result']['postcode']).to be_a(String)
		end
	end

	it "Expects postcode to be 6 to 8 characters long" do
		@multiple_postcode_body['result'].each do |outcome|
			expect(outcome['result']['postcode'].delete(' ').length).to be >= 6
			expect(outcome['result']['postcode'].delete(' ').length).to be <= 8
		end
	end

	it "Expects quality to be an integer" do
		@multiple_postcode_body['result'].each do |outcome|
			expect(outcome['result']['quality']).to be_a(Integer)
		end
	end

	it "Expects quality to be ranged from 1 and 9" do
		@multiple_postcode_body['result'].each do |outcome|
			expect(outcome['result']['quality']).to be >= 1
			expect(outcome['result']['quality']).to be <= 9
		end
	end

	it "Expects country to be a string" do
		@multiple_postcode_body['result'].each do |outcome|
			expect(outcome['result']['country']).to be_a(String)
		end
	end

	it "Expects longitude and latitude to be a float" do
		@multiple_postcode_body['result'].each do |outcome|
			expect(outcome['result']['longitude']).to be_a(Float)
			expect(outcome['result']['latitude']).to be_a(Float)
		end
	end

	# it "Expects longitude and latitude from both APIs to match up to 4 dp" do
	# 	i = 0
	# 	@multiple_postcode_body['result'].each do |outcome|
	# 		expect(outcome['result']['longitude'].round(4)).to eq @ran_postcode[i].longitude.round(4)
	# 		expect(outcome['result']['latitude'].round(4)).to eq @ran_postcode[i].latitude.round(4)
	# 		i += 1
	# 	end
	# end

	it "Expects outward code to be 2 to 4 characters long and a string" do
		@multiple_postcode_body['result'].each do |outcome|
			expect(outcome['result']['outcode']).to be_a(String)
			expect(outcome['result']['outcode'].length).to be <= 4
			expect(outcome['result']['outcode'].length).to be >= 2
		end
	end

	it "Expects inward code to be 3 characters long and a string" do
		@multiple_postcode_body['result'].each do |outcome|
			expect(outcome['result']['incode']).to be_a(String)
			expect(outcome['result']['incode'].length).to eq 3
		end
	end

end