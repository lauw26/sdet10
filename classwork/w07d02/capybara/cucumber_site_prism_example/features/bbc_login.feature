
Feature: Login
As a bbc user
I want to be able to login
	@login
	Scenario: As a registered user I am able to login
		Given I can access the bbc homepage
		And I am able to click sign in
		When I enter valid login details
		And I click sign in
		Then I have been signed in

	@login_non_reg	
	Scenario: As a non-registered user I am unable to login
		Given I can access the bbc homepage
		And I am able to click sign in
		When I enter invalid login details
		And I click sign in
		Then I recieve an error