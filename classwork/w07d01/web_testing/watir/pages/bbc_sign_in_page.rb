class SignInPage

	def initialize(browser)
		@browser = browser
		# page objects gets the id of the objects
		@sign_in_url = 'https://account.bbc.com/signin'
		@username = 'username-input'
		@password = 'password-input'
		@submit = 'submit-button'
		@form_error = 'form-error-username'
	end

	def access_sign_in
		# use browser that was passed through to go to url of sign in
		@browser.goto(@sign_in_url)
	end
	# declares the username input
	def user_name_input 
		@browser.text_field(id: @username)
	end
	# declares the password input
	def password_input 
		@browser.text_field(id: @password)
	end
	# declares the submit button
	def submit_button 
		@browser.button(id: @submit)
	end
	# declares the login error msg
	def form_error_span
		@browser.span(id: @form_error)
	end
	# fills in the username
	def add_user_name(username)
		user_name_input.set(username)
	end
	# fills in the password
	def add_password(password)
		password_input.set(password)
	end
	# clicks the submit button to login
	def click_submit_button
		submit_button.click
	end


end