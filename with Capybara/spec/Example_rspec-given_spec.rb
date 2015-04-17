require 'spec_helper'
require 'PageObjects/ExamplePageObjects'

describe "Example" do
  
  let(:ex) { Example.new(@Capybara) }

  context "Example" do 
    Given { ex.example_1 }
    Then  { ex.example_2 }

    context "Sub_Example" do
      Given { ex.example_3 }
      When  { ex.example_4 }
      Then  { ex.example_5 }
    end

  end

end