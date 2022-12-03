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

    it "has_cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        
        expect(deck.cards).to eq(cards)
    end

    it "has_rank_of_cards_at" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
        # require "pry"; binding.pry
    end

    it "shows high_ranking_cards" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
#  require "pry"; binding.pry
        deck = Deck.new(cards)
        expect(deck.high_ranking_cards).to eq([card1, card3])

    end 

    it "gives percent_high_ranking" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
#  require "pry"; binding.pry
        deck = Deck.new(cards)
        # require "pry"; binding.pry
    
        expect(deck.percent_high_ranking).to eq(66.67)
        #   require "pry"; binding.pry
    end 

    it "will remove_card" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)
#  require "pry"; binding.pry
        expect(deck.remove_card).to eq(card1)
        # expect(deck.cards).to eq([card2, card3])
    end 

    it "show high_ranking_cars" do 
        
    end 






end    


