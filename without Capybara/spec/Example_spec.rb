require 'spec_helper'
require 'PageObjects/ExamplePageObjects'

describe "Desktop Chat" do
  
	before(:each) do
    	@ex = Example.new(@driver)
  	end

  	it "example" do
  		@ex.visit
      @ex.example
  	end

end