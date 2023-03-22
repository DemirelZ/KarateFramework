Feature: welcome to Karate

  Scenario: how to print
    Given print "Hello Karate world"
    When print 'tek tırnak da kabul eder'
    * print "my name is"+" okkes"
      # virgül iki string birleştiriken araya bir boşluk sağlar
    * print "my name is","okkes"

  Scenario: Variables
    * def name = "Robert"
    * print "My name is", name
    * def age = 19
    * print name, "is", age, "years old"
    * print 5+5

  Scenario: Difficult Parameters
    * def user = {"name" : "Hasan", "role" : "admin"}
    * print user
    * print user.name
    * print user.role

    @wip
  Scenario: Json Body
    * def user =
            """
            {"name" : "Hasan",
            "role" : "admin",
            "age" : 24

            }
            """
    * print user
    * print user.age

      Scenario: json body with array objects
        Given def user =
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

        * print user
        * print user[0].name
        * print user[1].role
