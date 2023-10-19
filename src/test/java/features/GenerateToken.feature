Feature: Generate Token

Scenario: testing endPoint get /api/accounts/get-account
  Given url "https://tek-insurance-api.azurewebsites.net"
  Given path "/api/token"
  Given request {"username": "supervisor","password": "tek_supervisor"}
  When method post
  Then status 200
