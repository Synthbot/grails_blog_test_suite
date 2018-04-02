Feature: View Blog Entries
  In order to stay up to date
  As a Reader
  I want to be able to view blog posts of my favorite blogger

  Scenario: View Recent Blog Posts
    Given my favorite blogger has been very active
    When I visit the blog for my favorite blogger

  Scenario: View a Blog Post
    Given I visit the blog for my favorite blogger
    When I choose a blog post
    Then I should see the blog post

