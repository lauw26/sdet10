
describe "Bbc site stuff" do

	before(:all) do
		# Initializing a bbc_site object and create a chrome browser
		@bbc_site = BbcSite.new(:chrome)
	end

	it "Should goto homepage" do
		@bbc_site.homepage.goto
		expect(@bbc_site.homepage.current_url).to eql 'https://www.bbc.co.uk/'
	end

	it "Should click the sign in button" do

	end

end