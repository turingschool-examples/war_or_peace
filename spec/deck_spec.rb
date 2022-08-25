require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
    it 'has cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        
        deck = Deck.new([card1, card2, card3])
        expect(card1).to be_an_instance_of(Card)
        expect(card2).to be_an_instance_of(Card)
        expect(card3).to be_an_instance_of(Card)
    end

    it 'has cards as part of the deck' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        deck = Deck.new([card1, card2, card3])
        expect(deck).to be_an_instance_of(Deck)
        expect(deck.cards).to eq([card1, card2, card3])
    end

    it 'has a rank for each card' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        deck = Deck.new([card1, card2, card3])
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'has high ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        deck = Deck.new([card1, card2, card3])
        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it 'has a certain percentage of high ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        deck = Deck.new([card1, card2, card3])
        # expected to equal 66.6 repeating
        expect(deck.percent_high_ranking).to eq(2/3.to_f * 100)
    end

    it 'can have cards removed' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        deck = Deck.new([card1, card2, card3])

        deck.remove_card
        expect(deck.cards).to eq([card2, card3])
        expect(deck.high_ranking_cards).to eq([card3])
        expect(deck.percent_high_ranking).to eq(50.0)
    end
end