Before do |scenario|
  Selenium::WebDriver::Chrome.driver_path=File.absolute_path(File.dirname(__FILE__)) + '/chromedriver.exe'
  start_browser
end
