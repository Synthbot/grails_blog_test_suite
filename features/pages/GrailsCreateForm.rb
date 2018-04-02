require 'watir'
require 'rspec'
require 'page-object'

class GrailsCreateForm < BasePage

  text_area(:title, :id => 'title')
  text_area(:body ,:id => 'postText')
  button(:submit , :id => 'create')

end