=begin
Then(/^the url should contain information about the post$/) do
  pending
end
=end

When(/^I search for a blog post using information that will return a single result$/) do
  @current_page.searchText = '(e)'
  @current_page.searchText.send_keys :enter
end

Then(/^I should see only that post$/) do
  expect(posts).to include ('(e)')
end

When(/^I search for a blog post$/) do
  @current_page.searchText = 'sad'
  @current_page.searchText.send_keys :enter
end

Then(/^I should see posts with that value in the title$/) do
  expect(posts).to include('sad')
end