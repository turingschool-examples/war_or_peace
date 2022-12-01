require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it "exists" do
        deck = Deck.new
        expect(deck).to be_an_instance_of(Deck)
    end

    it "reads the cards attribute" do
        card1 = Card.new(:diamond, 'Queen', 12)
        expect(card1).to be_an_instance_of(Card)
    end

    it "returns the rank of a card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(1)).to eq(3)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "creates an array of high ranking cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it "gives the percentage of face cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        cards = [card1, card2]

        deck = Deck.new(cards)
        deck.high_ranking_cards
        expect(deck.percent_high_ranking).to eq(50.0)
    end

    it "gives a correct decimal percentage" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        deck.high_ranking_cards
        expect(deck.percent_high_ranking).to eq(66.67)
    end

    #for the % of face cards,
    # % of high ranking must be run to create array

    it "will remove the top card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        cards = [card1, card2]

        deck = Deck.new(cards)
        deck.remove_card
        expect(deck.cards).to eq([card2])
    end

    it "will add a card to the bottom of the deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        cards = [card1, card2]

        deck = Deck.new(cards)
        card3 = Card.new(:heart, 'Ace', 14)
        deck.add_card(card3)

        expect(deck.cards).to eq([card1, card2, card3])
    end
end