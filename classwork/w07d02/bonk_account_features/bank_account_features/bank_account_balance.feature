Feature: transactions
	As a customer
	I want to be able to view my transactions
	So that I can check my expenditure

	Scenario: As a valid logged in user I am able to view my transactions  
		Given	I have successfully logged onto my account  
		When	I click on the transaction link
		Then	I can see the transactions of the account to check my expenditure

	Scenario: As a valid logged in user I am able to view my account balance
		Given 	I have successfully logged onto my account 
		When 	I click on the balance link
		Then	I can see the balance of the account 

	

