#allows for Given-When-Then examples
require 'rspec/given'
#allows for use of "it"
require 'rspec'

require 'capybara'
require 'selenium/webdriver'
require 'capybara/poltergeist'
require 'yaml'

include RSpec::Matchers

# Load config file
ConfigFile = YAML.load_file('config.yml')
BaseURL = ConfigFile['base-url']

#load data
MockedData = YAML.load_file('data/users.yml')

RSpec.configure do |config|
  config.include Capybara::DSL
end


if (ConfigFile["run-headless"]) 

	# Run headless
	Capybara.register_driver :poltergeist do |app|
	Capybara::Poltergeist::Driver.new(
	  app,
	  window_size: [1280, 1024],
	  debug:       false,
	  js_errors: false
	)
	end

	RSpec.configure do |config|

	config.before(:all) do
	  @Capybara = Capybara::Session.new(:poltergeist)
	  Capybara.default_driver = :poltergeist
	end
	end
else 
	if (ConfigFile["run-in-chrome"])

		chrome_switches = %w[--start-fullscreen]
		caps_opts = {'chrome.switches' => chrome_switches}
		caps = Selenium::WebDriver::Remote::Capabilities.chrome(caps_opts)
		opts = {
		  :browser => :chrome,
		  :desired_capabilities => caps
		}

		Capybara.register_driver :chrome do |app|
		Capybara::Selenium::Driver.new(
		  app,
		  opts
		)
		end

		Capybara.javascript_driver = :chrome

		RSpec.configure do |config|

		config.before(:all) do
		  @Capybara = Capybara::Session.new(:chrome)
		  Capybara.default_driver = :chrome
		end
		end
else 
	if (ConfigFile["run-in-safari"])

		chrome_switches = %w[--start-fullscreen]
		caps_opts = {'safari.switches' => safari_switches}
		caps = Selenium::WebDriver::Remote::Capabilities.safari(caps_opts)
		opts = {
		  :browser => :safari,
		  :desired_capabilities => caps
		}

		Capybara.register_driver :safari do |app|
		Capybara::Selenium::Driver.new(
		  app,
		  opts
		)
		end
		Capybara.javascript_driver = :safari

		RSpec.configure do |config|

		config.before(:all) do
		  @Capybara = Capybara::Session.new(:safari)
		  Capybara.default_driver = :safari
		end
		end
else 
	if (ConfigFile["run-in-firefox"])

		chrome_switches = %w[--start-fullscreen]
		caps_opts = {'firefox.switches' => firefox_switches}
		caps = Selenium::WebDriver::Remote::Capabilities.firefox(caps_opts)
		opts = {
		  :browser => :firefox,
		  :desired_capabilities => caps
		}

		Capybara.register_driver :firefox do |app|
		Capybara::Selenium::Driver.new(
		  app,
		  opts
		)
		end
		Capybara.javascript_driver = :firefox

		RSpec.configure do |config|

		config.before(:all) do
		  @Capybara = Capybara::Session.new(:firefox)
		  Capybara.default_driver = :firefox
		end
		end
	else 
		RSpec.configure do |config|
			config.before(:all) do
			  @Capybara = Capybara::Session.new(:selenium)
			  Capybara.default_driver = :selenium
			end
		end
	end

	if (ConfigFile["keep-browser-open"]) 
		Capybara::Selenium::Driver.class_eval do
		  def quit
		    puts "Press RETURN to quit the browser"
		    $stdin.gets
		    @browser.quit
		  rescue Errno::ECONNREFUSED
		    # Browser must have already gone
		  end
		end
	end
end

