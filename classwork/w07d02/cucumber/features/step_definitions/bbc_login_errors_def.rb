Given(/^I am on the BBC home page$/) do
  @bbc_site = BbcSite.new
  @bbc_site.bbc_homepage.go_to_home_page
end

And(/^I move to the sign in page$/) do
  @bbc_site.bbc_homepage.click_sign_in
end

When(/^I proceed to register$/) do
  @bbc_site.bbc_signin.click_register
end

And(/^I input my DOB$/) do
  @bbc_site.bbc_register.input_DOB(21,8,1993)
  @bbc_site.bbc_register.click_submit
end

And(/^I input the necessary details with the password details (.*)$/) do |password|
  @bbc_site.bbc_register.fill_password(password)
  @bbc_site.bbc_register.click_submit
end

Then(/^I receive the corresponding error (.*)$/) do |error|
  expect(@bbc_site.bbc_register.show_password_error).to eq error
end
