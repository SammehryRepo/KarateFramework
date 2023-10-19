Feature: Create an account

  Background:
    Given url "https://tek-insurance-api.azurewebsites.net"
      #calling another feature file
      * def tokenResult = callonce read('GenerateToken.feature')
    * def token = "Bearer "+ tokenResult.response.token

    Scenario: Create and account
    Given path "/api/accounts/add-primary-account"
      * def dataGenerator = Java.type('data.DataGenerator')
      * def email = dataGenerator.getFakeEmail();
      * def name = dataGenerator.getFakeName();
    And request
    """
    {

      "email": "#(email)",
      "firstName": "#(name)",
      "lastName": "LastNameAdded",
      "title": "NoTitle",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "string",
      "dateOfBirth": "2023-11-19",

    }
    """
    When method post
    Then status 201
    Then print response
    #And assert response.httpStatus == "BAD_REQUEST"






