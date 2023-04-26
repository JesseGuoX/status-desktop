#******************************************************************************
# Status.im
#*****************************************************************************/
#/**
# * \file	test.feature
# *
# * \test	Status Sign up
# * \date	August 2022
# **
# *****************************************************************************/
Feature: Password strength validation including UI pixel-perfect validation

    The feature start sequence is the following (setup on its own `bdd_hooks`):
    ** given A first time user lands on the status desktop and generates new key
    ** and the user inputs username "tester123"

    Scenario Outline: As a user I want to see the strength of the password
		When the user inputs the password "<password>"
		Then the password strength indicator is "<strength>"

		Examples:
	      | password   | strength   |
	      | abc        | very_weak  |
	      | ABC        | very_weak  |
	      | 123        | very_weak  |
	      | +_!        | very_weak  |
		  | +1_3!48    | weak       |
		  | +1_3!48a   | so-so      |
	      | +1_3!48aT  | good  		|
	      | +1_3!48aTq | great 		|
