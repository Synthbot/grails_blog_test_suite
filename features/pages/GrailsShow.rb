class GrailsShow < BasePage

  div(:display_comments, :id => 'displayCommentTextBox')
  text_field(:name, :id => 'name')
  text_area(:comment,:id => 'comment')
=begin
  button(:save, :id => 'save')
=end
  button(:Show, :id => 'ShowPost')
  h2(:title, :id => 'title')
  span(:body ,:id => 'body')
  list_item(:comment_item, :class => 'commentItem')

  def display_comments
    self.display_comments_element.when_present.click
  end
end