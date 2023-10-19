Feature:

  Background:
    Given url "https://tek-insurance-api.azurewebsites.net"
      #calling another feature file
    * def tokenResult = callonce read('GenerateToken.feature')
    And print tokenResult

    Scenario: testing endPoint get /api/accounts/get-account

      Given path "/api/accounts/get-account"
      * def primaryPersonId = 11
      Given param primaryPersonId = primaryPersonId
      * def validToken = "Bearer " + tokenResult.response.token
      Given header Authorization = validToken
      When method get
      Then status 200
      And print response
      And assert response.primaryPerson.id == primaryPersonId

  Scenario: testing endPoint get /api/accounts/get-account

    Given path "/api/accounts/get-account"
    * def primaryPersonId = 678676
    Given param primaryPersonId = primaryPersonId
    * def validToken = "Bearer " + tokenResult.response.token
    Given header Authorization = validToken
    When method get
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id " +primaryPersonId+ " not found"