

describe "bbc login fail" do 

	before(:all) do
		# Initializing a bbc_site object and create a chrome browser
		@bbc_site = BbcSite.new(:chrome)
	end

	it "BBc homepage sign in link takes user to sign in page, fails login and checks for error message" do
		# Opens chrome and goes to bc homepage
		@bbc_site.homepage.access_homepage
		# Checks if the sign in button exists
		expect(@bbc_site.homepage.sign_in_button.exists?).to be true
		# Clicks the sign in button
		@bbc_site.homepage.click_sign_in_button
		# Inputs a random email into the username field
		@bbc_site.sign_in_page.add_user_name(Faker::Internet.email)
		# Inputs a 10 digit password in password field
		@bbc_site.sign_in_page.add_password(Faker::Number.number(10))
		# Clicks submit button to attempt a login with filled info
		@bbc_site.sign_in_page.click_submit_button
		# Checks error message to exist from failed login
		expect(@bbc_site.sign_in_page.form_error_span.exists?).to be true
	end
	
end 