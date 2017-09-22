class BbcRegisterPage

	include Capybara::DSL

	def initialize
		@register_page_url = 'https://account.bbc.com/register?context=homepage&nonce=aEQHPhW0-HYIvSI9u9fL-0uGII5CbINJT5cA&ptrt=https%3A%2F%2Fwww.bbc.co.uk%2F&userOrigin=homepage'
	end

	def go_to_register_page
		visit(@register_page_url)
	end

	def input_DOB(day,month,year)
		# find('day-input').set(day)
		fill_in('day-input', :with => day)
		fill_in('month-input', :with => month)
		fill_in('year-input', :with => year)
	end

	def click_submit
		click_button('submit-button')
	end

	def fill_password(password)
		fill_in('password-input', :with => password)
	end

	def show_password_error
		find(:xpath, '//*[@id="form-error-password"]').text
	end


end