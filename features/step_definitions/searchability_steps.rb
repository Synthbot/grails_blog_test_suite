require 'rspec'
require 'watir'

When(/^I search for a blog post using information that will return a single result$/) do
  sleep 1
  @current_page.searchText = '(e)'
  @browser.send_keys :enter
end

Then(/^I should see only that post$/) do
  expect(@current_page.topPost).to include('(e)')
end

When(/^I search for a blog post$/) do
  sleep 1
  @current_page.searchText = 'sad'
  @browser.send_keys :enter
end

Then(/^I should see posts with that value in the title$/) do
  expect(@current_page.topPost).to include('sad')
end