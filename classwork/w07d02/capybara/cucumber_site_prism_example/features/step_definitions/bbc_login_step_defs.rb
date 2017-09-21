Given(/^I can access the bbc homepage$/) do
  	@bbcwebsite = BbcSite.new
  	@bbcwebsite.bbc_homepage.load
end

And(/^I am able to click sign in$/) do
	pending
  	# click_link('idcta-link')
end

When(/^I enter valid login details$/) do
	pending
  	# fill_in('Email', with: 'emailexample@email.com')
  	# fill_in('Password', with: 'passwordexample')
end

And(/^I click sign in$/) do
	pending
	# click_button('submit-button')
end

Then(/^I have been signed in$/) do
	pending
  	# expect(find_by_id('idcta-username').text).to eq 'Your account'
end

When(/^I enter invalid login details$/) do
	pending
	# fill_in('Email', with: 'billymay@billy.com')
 #  	fill_in('Password', with: 'bishbashblip') 
end

Then(/^I recieve an error$/) do
	pending
  	# expect(find_by_id('form-error-username')).to_not be nil
end