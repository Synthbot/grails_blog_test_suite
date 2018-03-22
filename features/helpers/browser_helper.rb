module BrowserHelper

  def start_browser
    @browser = Watir::Browser.new :chrome
  end

end

World BrowserHelper