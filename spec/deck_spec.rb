require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    before do
        @card1 = Card.new(:diamond, 'Queen', 12)
        @card2 = Card.new(:spade, '3', 3)
        @card3 = Card.new(:heart, 'Ace', 14)
        @cards = [@card1, @card2, @card3]    

        @deck = Deck.new(@cards)
    end

    it "exists" do
        expect(@deck).to be_a(Deck)
    end

    it "has cards" do
        expect(@deck.card).to be_a([])
    end


end
