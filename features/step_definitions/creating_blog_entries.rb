Given(/^(?:I am| (?:a|the) user has) logged in as a blogger$/) do
  visit(LoginPage)
  @current_page.username = 'mbeebe'
  @current_page.password= 'abc123'
  @current_page.login
end

When(/^I publish a new blog post$/) do

  visit(GrailsBlogHome).new_blog_post
  on_page GrailsCreateForm
  @current_page.title = "Ben Franklin"
  @current_page.body = "Those who sacrifice liberty for security deserve neither, and will lose both"
  @current_page.submit
end

Then(/^I am notified that the blog post was successfully added$/) do
  visit GrailsBlogHome
end

And(/^I can see the post$/) do
  expect(@current_page.topPost).to include("Franklin")
end