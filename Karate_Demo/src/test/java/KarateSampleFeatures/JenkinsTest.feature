Feature: Test Jenkins for Cucumber Feature

  Background:

  Scenario Outline: Something needs to happen
    * def testString = "lucky"
    * match testString  == '<myString>'

    Examples:
      | myString |
      | lucky    |
      | Lucky    |
      | Not      |
      | So       |