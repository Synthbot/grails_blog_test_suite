Feature: Search Engine Friendly URLs
  In order to gain new followers
  As a Blogger
  I want my blog entries to be easily found by search engines



  Scenario: Search for Blog Post
    Given I visit the blog for my favorite blogger
    When I search for a blog post using information that will return a single result
    Then I should see only that post

  Scenario: Search for Blog Post
    Given I visit the blog for my favorite blogger
    When I search for a blog post
    Then I should see posts with that value in the title