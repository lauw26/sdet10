Given(/^I can access the bbc home page$/) do
	@bbcwebsite = BbcSite.new
	@bbcwebsite.bbc_homepage.load
end

And(/^I am able to click sign$/) do
	@bbcwebsite.bbc_homepage.click_sign_in_link
end

When(/^I enter valid login details$/) do
  # fill_in('Email', with: 'kcorn1982@gmail.com')
  # fill_in('Password', with: 'TestPassw0rd')
  @bbcwebsite.bbc_signin.input_user_name('kcorn1982@gmail.com')
  @bbcwebsite.bbc_signin.input_password('TestPassw0rd')
end

And(/^I click sign in$/) do
  # click_button('submit-button')
  @bbcwebsite.bbc_signin.click_submit
end

Then(/^I have been signed in$/) do
	pending
	# expect(find_by_id('idcta-username').text).to eq 'Your account'
	# expect(find(:xpath, '//*[@id="orb-modules"]/div[2]/section[2]/div/div')).not_to exist
end

When(/^I enter invalid login details$/) do
	pending
  # fill_in('Email', with: 'kcorn1982@gmail.com')
  # fill_in('Password', with: '123')
end

Then(/^i receive an error$/) do
	pending
	# expect(find(:css, '.form-message__text').text).to eq "Sorry, that password is too short. It needs to be six characters or more."
end