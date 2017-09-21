require_relative 'pages/bbc_home_page.rb'
require_relative 'pages/bbc_sign_in_page.rb'
require_relative 'pages/bbc_register_page.rb'

class BbcSite

	def bbc_homepage
		BbcHomePage.new
	end

	def bbc_signin
		BbcSignInPage.new
	end

	def bbc_register
		BbcRegisterPage.new
	end

end