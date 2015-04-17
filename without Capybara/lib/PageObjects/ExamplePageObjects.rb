require 'spec_helper'

class Example

	URL = BaseURL

	def initialize(driver)
		@driver = driver
	end

	def visit
		@driver.get URL
	end

	def example
		@driver.find_element(:xpath => example).click
	end

end