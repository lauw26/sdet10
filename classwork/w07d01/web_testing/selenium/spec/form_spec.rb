describe Form do
	before(:all) do 
		@form = Form.new
		@form.access_pratice_form
	end

	it "Should accept text in first name field" do
		@form.add_first_name(Faker::Name.first_name)
	end

	it "Should accept text in last name field" do
		@form.add_last_name(Faker::Name.last_name)
	end

end