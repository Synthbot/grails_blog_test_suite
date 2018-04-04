Feature: New users are able to register
  In order to gain new followers
  As a Blogger
  I want people to be able to sign up and post on my blog



  Scenario: New User login
    Given I create a new user
    When I access a blog post
    Then I should be able to comment