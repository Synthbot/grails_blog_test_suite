require 'rspec'
require 'watir'

Given(/^I create a new user$/) do
  visit GrailsBlogHome
  @browser.button(:id => "createUserButton").click
  on_page RegistrationPage
  @current_page.username = 'bob'
  @current_page.password = 'test'
  @browser.button(:id => "create").click
  @browser.button(:id => "submit").click
end

When(/^I access a blog post$/) do
  on_page GrailsBlogHome
  @current_page.topPost
  on_page GrailsShow
  @browser.button(:id => "ShowPost").click
end

Then(/^I should be able to comment$/) do
  @data = {comment: 'I get paid .01 cents an hour as I am a spambot'}
  @current_page.display_comments
  @current_page.populate_page_with @data
  @browser.button(:id => "save").click
end

And(/^I can see the comment$/) do
  expect(@current_page.commentsList).to include(@data[:comment])
end