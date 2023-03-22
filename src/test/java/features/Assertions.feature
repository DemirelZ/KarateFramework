Feature: Using match keyword

  Scenario: matching
    * def name = "Robert Albert"
    * match name == "Robert Albert"
    # Assert.assertEquals(name, "Robert Albert")
    * match name != "Hans"

  Scenario: Fuzzy Matching

    * def user =
      """
      {
  "name": "aFm",
  "email": "dev@krafttechexlab.com",
  "password": "123467",
  "about": "About Me",
  "terms": 10,
  "position": true
}
      """

    * match user.name == "#string"
 #     * match user.name == "#number"
    * match user.terms == "#number"
    * match user.position == "#boolean"
    * match user.country == "#notpresent"

  Scenario: Contains Matching

    * def users =
                """
        [
         {"name" : "Hasan",
            "role" : "admin",
            "age" : 24

            },
             {"name" : "Mehmet",
            "role" : "member",
            "age" : 25

            }
        ]
        """

    * def lenght = users.length
    * print lenght
    * print users
    * match users contains { "name": "Mehmet", "role": "member", "age": 25}

