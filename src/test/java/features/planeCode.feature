Feature: Plan Code Testing

  Background: setup test
    Given url "https://qa.insurance-api.tekschool-students.com";

  Scenario: validate /api/plans/get-all-plan-code
    Given path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
     #define a variable
    * def validToken = "Bearer "+response.token
    Given path "/api/plans/get-all-plan-code"
      #add a header to the request
    And header Authorization = "Bearer " + validToken
    Then method get
    And print response
      #validate response when it is in an array
    And assert response[0].planExpired == false
    And assert response[1].planExpired == false
    And assert response[2].planExpired == false
    And assert response[3].planExpired == false
      #And assert response[4].planExpired == false
