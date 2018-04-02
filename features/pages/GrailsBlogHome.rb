class GrailsBlogHome < BasePage

  page_url "http://localhost:8080/"

  link(:new_blog_post, :class => 'create')

  divs(:posts, class: 'individualPost')
  div(:topPost, :class => "portalLink row")
  link(:topPostLink, :class => "blogTitle")
  spans(:datePosted, class: 'postDate')
  text_field(:searchText, id: 'query')
  button(:submitSearch, id: 'searchButton')

  def number_of_posts
    self.posts_elements.size
  end

  def dates_of_posts
    self.posts_elements.map do |element|
      DateTime.parse(element.span.text)
    end
  end

  def search_for(text)
    @current_page.searchText = text
    @current_page.submitSearch
  end
end



