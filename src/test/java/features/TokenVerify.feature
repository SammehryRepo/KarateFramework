Feature: Security Token Verify

  Background: setup test
    Given url "https://qa.insurance-api.tekschool-students.com";
  Scenario: Verifying the token received
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    And path "/api/token/verify"
    And param username = "supervisor"
    And param token = response.token
    Then method get
    Then status 200
    And print response
    And assert response.status == true
    And assert response.httpStatus == "OK"
    And assert response.message == "Token is valid"


    Scenario: Send valid user name invalid token to /api/token/verify
      Then path "/api/token/verify"
      And param username = "supervisor"
      When param token = "wrong token"
      Then method get
      Then print response
      And status 400
      When assert response.errorMessage == "Token Expired or Invalid Token"






