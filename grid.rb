require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  options = Selenium::WebDriver::Options.safari
  @driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub', options: options
  end

def teardown
  @driver.quit
  end

def run
  setup
  yield
  teardown
  end

run do
  @driver.get 'http://the-internet.herokuapp.com'
  expect(@driver.title).to eq('The Internet')
end