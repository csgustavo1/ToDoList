require 'rubygems'
require 'selenium-webdriver'
require 'capybara'

Selenium::WebDriver::Chrome::Service#driver_path= "/usr/local/bin/chromedriver"
Capybara.default_selector = :css
Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
end    