require 'rspec'
#require 'pry'; binding.pry
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it "exists" do
        deck = Deck.new
        expect(deck).to be_an_instance_of(Deck)
    end
    
    it "can hold cards" do

        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3,]
        deck = Deck.new(cards)
        #require 'pry'; binding.pry
        expect(deck.cards).to eq(cards)
    end
    

end