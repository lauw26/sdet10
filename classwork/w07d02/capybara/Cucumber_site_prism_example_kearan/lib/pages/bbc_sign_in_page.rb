class Pages::BbcSignInPage < SitePrism::Page

	set_url "https://account.bbc.com/signin"
	set_url_matcher '/bbc.co*/'

	element :username_input, "input[id='username-input']"
	element :password_input, "input[id='password-input']"
	element :submit_button, "button[id='submit-button']"


	def input_user_name(username)
		username_input.set(username)
	end

	def input_password(password)
		password_input.set(password)
	end

	def click_submit
		submit_button.click
	end


end