require 'rubygems'
require 'selenium-webdriver'


Dado('que eu acessei a home page') do
    driver = Selenium::WebDriver.for :chrome
    driver.get "http://localhost:3000/"
end
  
