Feature: PUT Requests API

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

    # PUT Request Simple
  Scenario: PUT Request 1
    Given url 'https://reqres.in/api/users/5'
    And request {"name" : "Mertcan" , "job" : "Test Engineer"}
    When method PUT
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies


      # PUT with Background
    Scenario: PUT Request 2
      Given path '/users/5'
      And request {"name" : "Mertcan" , "job" : "Test Engineer"}
      When method PUT
      Then status 200
      And print response
      And print responseStatus
      And print responseTime
      And print responseHeaders
      And print responseCookies


      # PUT with Response assertion
      Scenario: PUT Request 3
        Given path '/users/5'
        And request {"name" : "Mertcan" , "job" : "Test Engineer"}
        When method PUT
        Then status 200
        And match response == { "name" : "Mertcan" , "job" : "Test Engineer", "updatedAt": "#ignore" }
        And print responseStatus
        And print responseTime
        And print responseHeaders
        And print responseCookies


