require 'rspec'
require './lib/deck'
require './lib/card'

Rspec.describe Deck do
    it "exists" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'ace', 14)
        cards = [card1, card2, card3]

        Deck.new(cards)
    
        expect(card).to be_an_instance_of(Card)
      end
    
      it "has readable attributes" do
        card = Card.new(:diamond, 'Queen', 12)
    
        expect(card.suit).to eq(:diamond)
        expect(card.value).to eq('Queen')
        expect(card.rank).to eq(12)
      end
    end