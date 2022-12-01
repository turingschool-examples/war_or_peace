require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    it "exists" do
      card1 = Card.new(:spades, "Ace", 14)
      card1 = Card.new(:diamonds, "Eight", 8)
      card1 = Card.new(:clubs, "Ace", 14)

      expect(card_arr).to be_an_instance_of(Deck)
    end
  
    it "has readable attributes" do
      card = Card.new(:diamonds, 'Queen', 12)
  
      expect(card.suit).to eq(:diamonds)
      expect(card.value).to eq('Queen')
      expect(card.rank).to eq(12)
    end
  end
  