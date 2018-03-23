require 'watir'
require 'rspec'
require 'page-object'

class GrailsCreateForm < BasePage




  text_field(:title, :name => 'title')
  text_area(:body ,:id => 'body')
  button(:submit , :name => 'create')

  # def when_ready
  #   self.title.when_present
  # end
end