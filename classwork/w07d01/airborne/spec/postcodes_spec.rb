describe "postcodes.io" do 

	before(:all) do
		@json = get 'http://api.postcodes.io/postcodes/b145rs'
	end

	it "Should recieve status of 200" do
		expect_status(200)
	end

	it "Check json keys in results" do
		expect_json_keys('result', [:postcode, :country, :admin_ward])
	end

	it "Check json keys in codes hash" do
		expect_json_keys('result.codes', [:admin_district, :admin_county, :parish])
	end

	it "Postcode should be a string" do
		expect_json_types('result', postcode: :string)
	end

	it "Postcode should be a string" do
		expect_json_types('result.codes', admin_district: :string)
	end

	it "header content length test" do
		expect_header(:content_length, "760")
	end

	it "json sizes" do
		expect_json_sizes(status: 5)
	end

end