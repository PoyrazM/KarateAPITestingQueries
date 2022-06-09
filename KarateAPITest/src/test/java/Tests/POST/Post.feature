Feature: POST Request API

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  # POST Request Simple
  Scenario: POST Request 1
    Given url 'https://reqres.in/api/users'
    And request { "name" : "Mertcan" , "job" : "QA and Test Engineer"}
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    # POST with Background
  Scenario: POST Request 2
    Given path '/users'
    And request { "name" : "Mertcan" , "job" : "QA and Test Engineer"}
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    # POST with Response assertion
  Scenario: POST Request 3
    Given path '/users'
    And request { "name" : "Mertcan" , "job" : "QA and Test Engineer"}
    When method POST
    Then status 201
    And match response == { "name": "Mertcan", "job": "QA and Test Engineer", "id": "#string", "createdAt": "#ignore" }
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    # POST with read response from file
  Scenario: POST Request 4
    Given path '/users'
    And request { "name" : "Mertcan" , "job" : "QA and Test Engineer"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    # POST with read request body from file
  Scenario: POST Request 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'/src/test/java/datas/request1.json'
    And print filePath
    And def requestBody1 = filePath
    And request requestBody1
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies


  # POST with read request body from file
  Scenario: POST Request 6
    Given path '/users'
    And def reqBody = read("request2.json")
    And set reqBody.job = 'Software Tester'
    And request reqBody
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

