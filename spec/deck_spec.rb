require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    it "it can add cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards =[card1, card2, card3] 
        deck = Deck.new(cards) 
        expect(cards).to eq([card1,card2, card3])
        
    end
    
    it "it ranks cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards =[card1, card2, card3] 
        deck = Deck.new(cards) 
        # require "pry"; binding.pry
      
    end
  end
  