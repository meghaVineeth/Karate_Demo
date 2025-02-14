Feature: Gherkin Table and Positive and negative validations

  Background:
    * def loginPath = '/api/login'

  Scenario: Positive and negative validations
    Given url baseURL
    And path apiPath
    When method get
    Then status 200
    * print "Response: ", response
    Then match response.data.id == 2
    Then match response.data.email == 'janet.weaver@reqres.in'
    And match response.data != null

  Scenario Outline: Testing Login Scenario '<Scenario>'
    * def payload1 =
    """
    {
      "email": "#(email)",
      "password": "#(Password)"
    }
    """

    * def payload2 =
    """
    {
      "email": "#(email)"
    }
    """

    * def reqPayload = ('<Scenario>' == 'Positive') ? payload1 : payload2

    Given url baseURL
    And path loginPath
    And request reqPayload
    When method post
    Then status <expRespCode>

    * print response


    Examples:
      | Scenario | email              | Password   | expRespCode|
      | Positive | eve.holt@reqres.in | cityslicka |200         |
      | Negative | eve.holt@reqres.in |            |400         |
