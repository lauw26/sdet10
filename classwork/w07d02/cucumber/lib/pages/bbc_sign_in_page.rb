class BbcSignInPage

	include Capybara::DSL

	def initialize
		@sign_in_page_url = 'https://account.bbc.com/signin/'
	end

	def go_to_sign_in_page
		visit(@sign_in_page_url)
	end

	def click_register
		find(:xpath, '//*[@id="signin-page"]/div[2]/div[2]/div[2]/div[2]/div/a').click
	end
end