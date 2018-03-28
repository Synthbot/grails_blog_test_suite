Given(/^(?:I am| (?:a|the) user has) logged in as a blogger$/) do
  visit(LoginPage)
  @current_page.username = 'me'
  @current_page.password= 'password'
  @current_page.login
end

When(/^I publish a new blog post$/) do

  visit(GrailsBlogHome).new_blog_post
  on_page GrailsCreateForm
  @current_page.title = "Poor Ozymandias"
  @current_page.body = "My name is Ozymandias, King of Kings; Look on my Works, ye Mighty, and despair! Nothing beside remains. Round the decay
 Of that colossal Wreck, boundless and bare The lone and level sands stretch far away."
  @current_page.submit

end

Then(/^I am notified that the blog post was successfully added$/) do
  visit GrailsBlogHome
end

And(/^the newly added blog post is at the top of the recent posts list$/) do
  expect(@current_page.topPost).to include("Ozymandias")
end