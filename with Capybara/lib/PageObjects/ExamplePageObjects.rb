require 'spec_helper'

class Example

	def initialize
		@session = session
	end

	def example_1
		@session.visit URL
	end

	def example_2
		@session.fill_in( Email , :with => userData[:email])
		@session.fill_in( Password , :with => userData[:password])
	end

	def example_3
		@session.click_button(Button)
	end

	def example_4
		@session.has_title? Title
	end

	def example_5
		expect(@session).to have_selector(Error_Message)
	end

end