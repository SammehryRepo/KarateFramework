Feature: Get all Accounts

  Background:

    Given url "https://tek-insurance-api.azurewebsites.net"
    * def generateToken = callonce read('GenerateToken.feature')
    * def token = "Bearer "+ generateToken.response.token

    Scenario: Get all account
      Given path "/api/accounts/get-all-accounts"
      Then header Authorization = token
      When method get
      Then status 200
      Then print response
