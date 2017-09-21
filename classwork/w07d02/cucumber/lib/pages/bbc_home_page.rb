class BbcHomePage

	include Capybara::DSL

	def initialize
		@home_page_url = 'https://www.bbc.co.uk/'
	end

	def go_to_home_page
		visit(@home_page_url)
	end

	def click_sign_in
		click_link('idcta-link')
	end


end