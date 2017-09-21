require_relative 'pages/bbc_homepage.rb'

class BbcSite

	def initialize(browser)
		@browser = Watir::Browser.new(browser)
	end

	def homepage
		BbcHomepage.new(@browser)
	end

	# def sign_in_page
	# 	SignInPage.new(@browser)
	# end

end