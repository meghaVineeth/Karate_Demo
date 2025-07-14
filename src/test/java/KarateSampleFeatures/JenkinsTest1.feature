@Jankins1
Feature: Test Jankins for Cucumber Feature

  Background:

  Scenario Outline: Something needs to happen
    * def testString = 'lucky'
    * print "Checking the string1"
    * def javaUtils = Java.type('ReusableUtils.XmlGenerator')
    * def javaUtlObj = new javaUtils
    * def generateXml = javaUtlObj.generateXml()
    * print karate.prettyXml(generateXml)
    * match testString  == '<myString>'

    Examples:
      | myString |
      | lucky    |
      | Lucky    |
      | Not      |
      | So       |