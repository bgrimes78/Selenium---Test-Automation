require 'spec_helper'
require 'PageObjects/ExamplePageObjects'

describe "Example" do
  
  let(:ex) { Example.new(@Capybara) }

  it 'example' do 
    @ex.exmaple_1
    @ex.exmaple_2
    @ex.exmaple_3
    @ex.exmaple_4
    @ex.exmaple_5
  end

end