class GrailsBlogHome < BasePage

  page_url "http://localhost:8080/"

  link(:new_blog_post, :class => 'create')

  # def when_ready
  #   self.title.when_present
  #   self
  # end

  divs(:posts, class: 'individualPost')
  div(:topPost, :class => "individualPost")
  link(:topPostLink, :class => "blogTitle")
  text_field(:searchText, id: 'searchBar')
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
end # GrailsBlogPage



