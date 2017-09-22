class BbcSite

	def bbc_homepage
		Pages::BbcHomePage.new
	end

	def bbc_signin
		Pages::BbcSignInPage.new
	end

end