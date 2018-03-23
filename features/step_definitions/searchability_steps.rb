

Then(/^the url should contain information about the post$/) do
  pending
end

When(/^I search for a blog post using information that will return a single result$/) do
  @current_page.searchText = 'seventh'
  @current_page.searchText.send_keys :enter
end

Then(/^I should see only that post$/) do
  expect(posts.size).to be 1
end

When(/^I search for a blog post$/) do
  @current_page.searchText = 'Ozymandias'
  @current_page.searchText.send_keys :enter
end

Then(/^I should see posts with that value in the title$/) do
  expect(posts).to include('Ozymandias')
end