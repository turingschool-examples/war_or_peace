require 'rspec'
require './lib/card'
require 'pry'

RSpec.describe Card do
  before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)  
    @cards = [@card1, @card2, @card3]
  end 
  it "exists" do

    expect(@card1).to be_an_instance_of(Card)
  end

  it "has readable attributes" do

    expect(@card1.suit).to eq(:diamond)
    expect(@card1.value).to eq('Queen')
    expect(@card1.rank).to eq(12)
  end
end
