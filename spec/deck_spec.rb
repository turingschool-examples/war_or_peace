require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it "exists" do
        cards = []
        deck = Deck.new(cards)
        expect(deck).to be_an_instance_of(Deck)
    end
    it "contains cards" do
        cards = []
        cards.push(Card.new(:diamond, "Queen", 13))
        cards.push(Card.new(:spade, "Three", 3))
        cards.push(Card.new(:heart, "Ace", 14))
        deck = Deck.new(cards)

        expect(deck.cards.count).to eq(3) 
    end

    it "can check a card's rank" do
        cards = []
        cards.push(Card.new(:diamond, "Queen", 13))
        cards.push(Card.new(:spade, "Three", 3))
        cards.push(Card.new(:heart, "Ace", 14))
        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to eq(13)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end
end
        