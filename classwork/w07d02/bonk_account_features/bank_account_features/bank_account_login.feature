Feature: Login
	As a customer
	I want to be able to login to my account
	So that I can check my balance

	Scenario: As a user I am able to login to my registered account 
		Given 	I am on the login page 
		When 	I input valid credentials
		And 	I press the login button
		Then	I am logged onto my account

	Scenario: As a unregistered user I am able to see a error when attempting to login 
		Given 	I am on the login page 
		When 	I input invalid credentials
		And 	I press login button
		Then	I can see a login error message stating incorrect username or password

	


	