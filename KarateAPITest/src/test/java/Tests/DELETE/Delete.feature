Feature: DELETE Requests API

  Scenario: DELETE Request 1
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies
