Feature: Get Request API

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  # Simple GET Request
  Scenario: Get Request 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies


  # GET with Background
  Scenario: Get Request 2
      Given path '/users/2'
      When method GET
      Then status 200
      And print response
      And print responseStatus
      And print responseTime
      And print responseHeaders
      And print responseCookies

    # With Background , path and params
  Scenario: Get Request 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    # With Assertions
  Scenario: Get Request 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name !=null
    And assert response.data.length == 6
    And match $.data[3].id == 10
    And match $.data[5].last_name == 'Howell'



