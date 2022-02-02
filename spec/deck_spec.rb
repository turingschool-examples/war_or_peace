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
        card1 = Card.new(:diamond, "Queen", 13)
        card2 = Card.new(:spade, "Three", 3)
        card3 = Card.new(:heart, "Ace", 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.cards.count).to eq(3) 
    end

    it "can check a card's rank" do
        card1 = Card.new(:diamond, "Queen", 13)
        card2 = Card.new(:spade, "Three", 3)
        card3 = Card.new(:heart, "Ace", 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(0)).to eq(13)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "can find high-ranking cards" do
        card1 = Card.new(:diamond, "Queen", 13)
        card2 = Card.new(:spade, "Three", 3)
        card3 = Card.new(:heart, "Ace", 14)
        cards = [card1, card2, card3]
        high_rank = [card1, card3]

        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq(high_rank)
    end

    it "can tell percentage of high ranking cards remaining" do
        card1 = Card.new(:diamond, "Queen", 13)
        card2 = Card.new(:spade, "Three", 3)
        card3 = Card.new(:heart, "Ace", 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.percent_high_ranking).to eq(66.67)
    end

    it "can remove a card from the top of the deck" do
        card1 = Card.new(:diamond, "Queen", 13)
        card2 = Card.new(:spade, "Three", 3)
        card3 = Card.new(:heart, "Ace", 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        removed_card = deck.remove_card()

        expect(removed_card).to eq(card1)
        expect(deck.cards.count).to eq(2)
        expect(deck.high_ranking_cards.count).to eq(1)
        expect(deck.percent_high_ranking).to eq(50.00)
    end

    it "can add a card to the bottom of the deck" do
        card1 = Card.new(:diamond, "Queen", 13)
        card2 = Card.new(:spade, "Three", 3)
        card3 = Card.new(:heart, "Ace", 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        card4 = Card.new(:club, "Five", 5)
        deck.add_card(card4)
        high_rank = [card1, card3]

        expect(deck.cards.count).to eq(4)
        expect(deck.cards[3]).to eq(card4)
        expect(deck.high_ranking_cards).to eq(high_rank)
        expect(deck.percent_high_ranking).to eq(66.67)      
    end  
end
        