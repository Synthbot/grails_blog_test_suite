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

  sleep 1

end

When(/^I visit the blog for my favorite blogger$/) do
  visit LoginPage
  @current_page.username = 'tyeager'
  @current_page.password= 'abc321'
  @current_page.login
  visit GrailsBlogHome
end

When(/^I choose a blog post$/) do
  @current_page.topPost
  on_page GrailsShow
  @browser.button(:id => "ShowPost").click
end

Then(/^I should see the blog post$/) do

  expect(@current_page.title).to eq("Matt likes fuzzy headphones")
  expect(@current_page.body).to eq("Sennheiser, AKG, Grado")

end

