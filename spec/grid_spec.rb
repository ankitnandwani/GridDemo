require 'selenium-webdriver'
require 'rspec/expectations'
require 'rspec'
include RSpec::Matchers

describe "test" do

  before do
    options = Selenium::WebDriver::Options.safari
    @driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub', options: options
  end

  it 'verifies title' do
    @driver.get 'http://the-internet.herokuapp.com'
    expect(@driver.title).equal('The Internet')
  end

  after do
    @driver.quit
  end

end