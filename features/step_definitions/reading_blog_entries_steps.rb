require 'rspec'
require 'watir'



Given(/^my favorite blogger has been very active$/) do
  start_browser

  visit(GrailsBlogHome).new_blog_post
  on_page GrailsCreateForm
  @current_page.title = "Hello World"
  @current_page.body = "Goodbye World"
  @current_page.submit

  visit(GrailsBlogHome).new_blog_post
  on_page GrailsCreateForm
  @current_page.title = "ello World"
  @current_page.body = "Goodbye World"
  @current_page.submit

  visit(GrailsBlogHome).new_blog_post
  on_page GrailsCreateForm
  @current_page.title = "llo World"
  @current_page.body = "Goodbye World"
  @current_page.submit

  visit(GrailsBlogHome).new_blog_post
  on_page GrailsCreateForm
  @current_page.title = "o World"
  @current_page.body = "Goodbye World"
  @current_page.submit

  visit(GrailsBlogHome).new_blog_post
  on_page GrailsCreateForm
  @current_page.title = "Do not go gentle into that good night"
  @current_page.body = "Rage, rage against the dying of the light"
  @current_page.submit


  sleep 1

end

When(/^I visit the blog for my favorite blogger$/) do
  visit GrailsBlogHome
end

Then(/^I should see a summary of my favorite blogger's (\d+) most recent posts in reverse order$/) do |expected_number_of_posts|
  # expect(@current_page.number_of_posts).to eq expected_number_of_posts

  post_dates = @current_page.dates_of_posts


  expect(post_dates[0]).to be > post_dates[1]
end

When(/^I choose a blog post$/) do
  @current_page.topPostLink
  on_page GrailsShow
end

Then(/^I should see the blog post$/) do

  expect(@current_page.title).to eq("Do not go gentle into that good night")
  expect(@current_page.body).to eq("Rage, rage against the dying of the light")

end

When(/^I search for a blog post$/) do
  pending
end

Then(/^I should see posts with that value in the title$/) do
  pending
end

When(/^I search for a blog post using information that will return a single result$/) do
  visit GrailsBlogHome
  @current_page.search_for 'Ozymandias'
  on GrailsSearchResults
end

Then(/^I should see only that post$/) do
  expect(@current_page.number_of_posts).to be 1
end