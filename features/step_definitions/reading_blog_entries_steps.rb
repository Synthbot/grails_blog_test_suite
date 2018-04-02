require 'rspec'
require 'watir'

Given(/^my favorite blogger has been very active$/) do
  start_browser

  visit(LoginPage)
  @current_page.username = 'mbeebe'
  @current_page.password= 'abc123'
  @current_page.login

  visit(GrailsBlogHome).new_blog_post
  on_page GrailsCreateForm
  @current_page.title = "Matt likes fuzzy headphones"
  @current_page.body = "Sennheiser, AKG, Grado"
  @current_page.submit
  visit LogoutPage

  sleep 3

end

When(/^I visit the blog for my favorite blogger$/) do
  visit LoginPage
  @current_page.username = 'tyeager'
  @current_page.password= 'abc321'
  @current_page.login
  visit GrailsBlogHome
end

Then(/^I should see a summary of my favorite blogger's (\d+) most recent posts in reverse order$/) do |expected_number_of_posts|
  # expect(@current_page.number_of_posts).to eq expected_number_of_posts

  post_dates = @current_page.datePosted


  expect(post_dates[0]).to be > post_dates[1]
end

When(/^I choose a blog post$/) do
  @current_page.topPostLink
  on_page GrailsShow
end

Then(/^I should see the blog post$/) do

  expect(@current_page.title).to eq("Matt likes fuzzy headphones")
  expect(@current_page.body).to eq("Sennheiser, AKG, Grado")

end

