require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

RSpec.describe Deck do
    it "exists" do

        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)

  
        expect(deck).to be_an_instance_of(Deck)
        

    end

    it "can gain new cards" do
        
        card_1 = Card.new(:spade, 'Ace', 14)
        card1 = Card.new(:diamond, 'Queen', 12)
        cards = [card_1, card1]
        deck = Deck.new(cards)
        card_2 = Card.new(:heart, 'Queen', 12)
        
        p card_1
        
        deck.add_card(card_2)
       
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.suit_of_card_at(0)).to eq(:heart)
        expect(deck.value_of_card_at(0)).to eq('Queen')

     
    end

    it "has readable attributes" do
        card_1 = Card.new(:diamond, 'Queen', 12)
        card_2 = Card.new(:spade, '3', 3)
        card_3 = Card.new(:heart, 'Ace', 14)

       cards = [card_1, card_2, card_3]
        
        deck = Deck.new(cards)
        # deck.add_card(card_2)
        # deck.add_card(card_3)
        
    
        
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.suit_of_card_at(0)).to eq(:diamond)
        expect(deck.value_of_card_at(0)).to eq('Queen')

        

    end

    it "can read 1st or 3rd card rank" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1]
        

        deck = Deck.new(cards)
        deck.add_card(card2)
        deck.add_card(card3)

        expect(deck.rank_of_card_at(0)).to equal(14)
        expect(deck.rank_of_card_at(2)).to equal(12)
        

    end

    it "has high Face Cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1]

        deck = Deck.new(cards)
        deck.add_card(card2)
        deck.add_card(card3)
        
        expect(deck.high_ranking_cards).to eq(true)



    end

    it "has no face cards" do
        card2 = Card.new(:spade, '3', 3)
        cards = [card2]
        deck = Deck.new(cards)
        expect(deck.high_ranking_cards).to eq(false)
        

    end

    it "has percent Face Cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1]

        deck = Deck.new(cards)
        deck.add_card(card2)
        deck.add_card(card3)

        expect(deck.percent_high_ranking).to eq(66.67)

    end

    it "draws cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1]

        deck = Deck.new(cards)
        deck.add_card(card2)
        deck.add_card(card3)

        expect(deck.remove_card.rank).to eq(12)        

    end

end

