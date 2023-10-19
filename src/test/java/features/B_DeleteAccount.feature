Feature: Delete Account functionality

  Background: Test Setup and Create New Account.
    * def createAccount = callonce read('createAccount.feature')
    * def validToken = createAccount.token
    * def createdAccountId = createAccount.response.id
    And print createAccount
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Successfull delete account
  	Given path "/api/accounts/delete-account"
  	And param primaryPersonId = createdAccountId
  	And header Authorization = validToken
  	When method delete
  	Then status 200
  	#And assert response == "Account Successfully deleted"
  	Given path "/api/accounts/delete-account"
  	And param primaryPersonId = createdAccountId
  	And header Authorization = validToken
  	When method delete
  	Then status 404
  	And print response
  	And assert response.errorMessage == "Account with id " + createdAccountId + " not exist"