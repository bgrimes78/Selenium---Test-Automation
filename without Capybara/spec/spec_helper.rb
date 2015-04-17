require 'rspec'
require 'selenium-webdriver'
require 'yaml'

include RSpec::Matchers

# Load config file
ConfigFile = YAML.load_file('config.yml')
BaseURL = ConfigFile['base-url']

RSpec.configure do |config|
 
  config.before(:each) do
    @driver = Selenium::WebDriver.for :chrome
  end
 
  config.after(:each) do
    @driver.quit
  end
 
end