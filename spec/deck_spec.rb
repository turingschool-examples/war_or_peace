require 'rspec'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new

    expect(deck).to be_an_instance_of(Deck)
  end

  xit 'gives card at index 0' do
    deck = Deck.new
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14) 
    expect(deck.card[0].rank).to eq(12)
  end

end
