require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

describe Deck do
    it 'exists' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        
        deck = Deck.new(cards)
        expect(deck).to be_an_instance_of(Deck)
    end

    describe 'rank_of_card_at' do
        it 'takes 1 argument that reps the index 
        position of a card, and returns the rank of 
        that card' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.rank_of_card_at(0)).to eq(12)
        end
    end    

    describe 'high_ranking_cards' do
        it 'returns an array of cards in the deck that 
        have a rank of 11 or above (faces & aces)' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])
        end
    end

    describe 'percent_high_ranking' do
        it 'returns the percentage of cards that are high ranking' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
        end
    end 

    describe 'remove_card' do 
        it 'removes the top card from the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]

            deck = Deck.new(cards)
            expect(deck.remove_card).to eq(card1)
        end
    end 
    
    describe 'add_card' do 
        it 'adds one card to the bottom of deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
        
            deck = Deck.new(cards)
            card4 = Card.new(:club, '5', 5)
            deck.add_card(card4)
            expect(deck.cards).to eq([card1, card2, card3, card4])
        end
    end
end





