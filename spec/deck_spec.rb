require 'rspec'
require './lib/deck'
require './lib/card'



RSpec.describe Deck do

    it 'makes cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        @cards = [card1, card2, card3]
        deck = Deck.new([card1, card2, card3])

        expect(card1).to eq(card1)
    end 
    it "is a deck" do
        deck = Deck.new([])

        expect(deck).to be_a(Deck)
    end 

    it 'has cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        @cards = [card1, card2, card3]

        expect(@cards).to eq([card1, card2, card3])
    end 
   
    it 'has a rank' do
        
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        @cards = [card1, card2, card3]
        deck = Deck.new([card1, card2, card3])

        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'has a high ranking card' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        @cards = [card1, card2, card3]
        deck = Deck.new([card1, card2, card3])

        expect(deck.high_ranking_cards).to eq([card1, card3])
    end 

    it 'has a percentage of high ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        @cards = [card1, card2, card3]
        deck = Deck.new([card1, card2, card3])

        expect(deck.percent_high_ranking).to eq(66.67)
    end

    it 'removes a card' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        @cards = [card1, card2, card3]
        deck = Deck.new([card1, card2, card3])

        expect(deck.remove_card).to eq(card1)
        expect(deck.percent_high_ranking).to eq(50)
    end 

    it 'adds a card' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        @cards = [card1, card2, card3]
        deck = Deck.new([card1, card2, card3])
        deck.remove_card
        card4 = Card.new(:cloub, '5', 5)

        expect(deck.add_card(card4)).to eq([card2,card3,card4])
        expect(deck.percent_high_ranking).to eq(33.33)
    end 




end 




   