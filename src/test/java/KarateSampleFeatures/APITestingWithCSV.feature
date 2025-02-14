Feature: Some examples of API testing with CRUD operations

  Background:
    * def crudPath1 = '/api/users'
    * def crudPath2 = '/api/users/2'

    * def javaUtils = Java.type('ReusableUtils.JavaUtils')
    * def javaUtlObj = new javaUtils

  Scenario Outline: Post values and validate
    * def completePath = ('<Scenario>' == 'Create') ? crudPath1 : crudPath2
    * def reqPayload =
    """
    {
      "name": "#(name)",
      "job": "#(job)"
    }
    """

    Given url baseURL
    And path completePath
    And request reqPayload
    When method <method>
    Then status <expRespCode>
    * print '<Scenario>', response
    And match response.job == '<job>'

    Examples:
#      | Scenario | name | job     | method | expRespCode |
#      | Create   | hij  | Teacher | POST   | 201         |
#      | Patch    | hij  | PMO     | PATCH  | 200         |
      | read('../TestData/TestData.csv') |
