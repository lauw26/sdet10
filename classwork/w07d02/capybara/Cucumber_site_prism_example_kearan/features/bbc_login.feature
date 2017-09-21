Feature: Login
As a bbc user
I want to be able to login
	
	@login
	Scenario: As a registered user I am able to login
		Given I can access the bbc home page
		And I am able to click sign
		When I enter valid login details
		And I click sign in 
		Then I have been signed in


	@non-reg-user
	Scenario: As a non-registered user I cannot login
		Given I can access the bbc home page
		And I am able to click sign
		When I enter invalid login details
		And I click sign in 
		Then i receive an error