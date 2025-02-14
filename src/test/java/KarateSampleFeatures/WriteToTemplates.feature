Feature: Writing to json/xml file

  Background:
#    * def searchField = 'first_name'
#    * def searchValue = 'Janet'
    * def writePath = '../src/test/java/ProcessedTemplates/'
    * def javaUtils = Java.type('ReusableUtils.JavaUtils')
    * def javaUtlObj = new javaUtils

  Scenario Outline: Store response from the API and write a json/xml file
    Given url baseURL
    And path apiPath
    When method get
    Then status 200
    * def respBlock = karate.jsonPath(response, "$..data[?(@."+'<searchField>'+" == '"+'<searchValue>'+"')]")
    * print "respBlock: ", respBlock.id
    * def respId = karate.jsonPath(respBlock, "$..id")[0]
    * def respAvatar = karate.jsonPath(respBlock, "$..avatar")[0]
    * def respFName = karate.jsonPath(respBlock, "$..first_name")[0]
    * def respLName = karate.jsonPath(respBlock, "$..last_name")[0]
    * def respEmail = karate.jsonPath(respBlock, "$..email")[0]

    * xml xmlPayload = read('classPath:XMLTemplates/SampleXML_Template.xml')
    * def jsonPayload = read('classPath:XMLTemplates/SampleJson.json')

    * def xmlFileName = javaUtlObj.currentDateTimeFileName() + '.xml'
    * def jsonFileName = javaUtlObj.currentDateByFormat('yyyyMMddHHMMSS') + '.json'

    * print karate.prettyXml(xmlPayload)
    * karate.write(karate.prettyXml(xmlPayload), writePath + xmlFileName)
    * karate.write(jsonPayload, writePath + jsonFileName)

    Examples:
      | searchField | searchValue            |
      | first_name  | Janet                  |
      | email       | janet.weaver@reqres.in |
      | id          | 2                      |