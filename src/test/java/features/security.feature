Feature: Security Token Tests

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  Scenario Outline: Generate valid token with valid username and password
    #Prepare request
    And request {"username": "<UserNameData>","password": "<PasswordData>"}
    When method post
    And print response
    Then status <statusCode>
    And assert response.httpStatus == "<httpsStatusData>"
    Examples:
      | UserNameData  | PasswordData | httpsStatusData       | errorMessage                |statusCode|
      | UserNameData  | UserNameData | NOT_FOUND             | User UserNameData not found |404       |
      | UserNameData  | PasswordData | NOT_FOUND             | User UserNameData not found |404       |
      | UserNameData  | PasswordData | NOT_FOUND             | User UserNameData not found |404       |
      | UserNameData  | PasswordData | NOT_FOUND             | User UserNameData not found |404       |
      | UserNameData  | PasswordData | NOT_FOUND             | User UserNameData not found |404       |





