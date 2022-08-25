require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'

RSpec.describe Deck do
  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)
    # binding.pry
    expect(@card3).to be_an_instance_of(Card)
  end
  
  describe 'Iteration 1' do
    it '1. Build a deck' do
      cards = [@card1, @card2, @card3]
      deck = Deck.new(cards)
      # binding.pry
      expect(deck).to be_an_instance_of(Deck)
    end
  end

  
end

# card = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3) 
# card3 = Card.new(:heart, 'Ace', 14)
