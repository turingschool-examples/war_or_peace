require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do

    it "exists" do

        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]

        deck = Deck.new(cards)
  
        expect(deck).to be_an_instance_of(Deck)
        
    end
  
    it "has readable array attribute" do

        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]

        deck = Deck.new(cards)
  
        expect(deck.cards).to eq(cards)
     
    end

    it "calculates rank of card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it "stores a list of high ranking cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it "shows percentage of high ranking cards relative to deck" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.percent_high_ranking).to eq(66.67)
    end 

    it "can remove card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.remove_card).to eq(card1)
    end


    it "can add card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '5', 5)

        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.add_card(card4)).to eq([card1, card2, card3, card4])
    end




end

