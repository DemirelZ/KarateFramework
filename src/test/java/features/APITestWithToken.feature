Feature: API Tests

  Background:
#    * def baseUrl = 'https://www.krafttechexlab.com/sw/api/v1/allusers'

    * def AuthFeature = call read('classpath:features/PostNewUser.feature')
    * def UserToken = AuthFeature.token
    * print "Tokens comes from backround", UserToken

    Scenario: add experience
      Given url 'https://www.krafttechexlab.com/sw/api/v1/experience/add'
      And header Authorization = UserToken
      And header Accept = "application/json; charset=UTF-8"
      * request
      """
      {
  "job": "King QA",
  "company": "Kraft Techex",
  "location": "USA",
  "fromdate": "2012-01-01",
  "todate": "2022-01-01",
  "current": "false",
  "description": "Description"
}
      """
      When method POST
      Then status 200
      * print response

      Given url 'https://www.krafttechexlab.com/sw/api/v1/experience/all'
      And header Authorization = UserToken
      And header Accept = "application/json; charset=UTF-8"
      When method GET
      Then status 200
      * print response

   #   * def expectedInfo = read('classpath:data/userInfo.json')
   #   Then match response == expectedInfo

  * match response.experience.location == "USA"

      