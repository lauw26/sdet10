class BbcHomePage

	def initialize(browser)
		@browser = browser
		# page objects
		@homepage_url = 'https://www.bbc.co.uk/'
		@sign_in_button = 'idcta-link'
	end

	def access_homepage
		# use browser that was passed through to go to url of homepage
		@browser.goto(@homepage_url)
	end

	def sign_in_button
		@browser.link(id: @sign_in_button)
	end

	def click_sign_in_button
		sign_in_button.click
	end


end