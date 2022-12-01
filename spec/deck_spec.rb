require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it 'is an instance of a deck' do
        deck1 = Deck.new('Deck 1')
        expect(deck1).to be_a(Deck)
    end

    it 'has a name' do
        deck1 = Deck.new('Deck 1')
        expect(deck1.name).to eq('Deck 1')
    end

    it 'starts with no cards' do
        deck1 = Deck.new('Deck 1')
        expect(deck1.cards).to eq([])
    end

    it "can add cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck1 = Deck.new('Deck 1')
        deck1.add_card(card1)
        deck1.add_card(card2)
        deck1.add_card(card3)
        expect(deck1.cards).to include(card1, card2, card3)
    end

    it 'can index card rank in deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        deck1 = Deck.new('Deck 1')
        deck1.add_card(card1)
        deck1.add_card(card2)
        deck1.add_card(card3)
        expect(deck1.rank_of_card_at(0)).to eq(12)
        expect(deck1.rank_of_card_at(2)).to eq(14)
    end
end

