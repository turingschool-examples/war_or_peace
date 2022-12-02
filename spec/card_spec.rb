#gives access to Card and RSpec
#Rspec is a unit test framework for Ruby
require 'rspec'
require './lib/card'

#defines Card collection of tests
RSpec.describe Card do 
  #describes the test
  it 'var card should exist as a Card object' do
    #makes the var card a Card object
    card = Card.new(:diamond, 'Queen', 12)
    #assertion
    expect(card).to be_an_instance_of(Card)
  end

  it "var card should have readable attributes" do
    #makes the var card a Card object
    card = Card.new(:diamond, 'Queen', 12)
    #assertion
    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end
end



