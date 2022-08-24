require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do 
    describe '#initialize' do 
        it 'exists' do 
            deck = Deck.new([])
            expect(deck).to be_an_instance_of(Deck)
        end 

        it 'has an array of cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.cards).to be_a(Array)
            expect(deck.cards).to eq(cards)
        end 
    end 
    describe '#rank_of_card_at()' do 
        it 'finds rank of card at certain index' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.rank_of_card_at(0)).to eq(12)
            expect(deck.rank_of_card_at(2)).to eq(14)
       end 
    end 
    describe '#high_ranking_cards' do 
        it 'finds high ranking cards in deck' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])
        end 
    end 
    describe '#percent_high_ranking' do 
        it 'calcs percent of cards that are high ranking' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
        end 
    end 
    describe '#remove_card' do 
        it 'removes and returns first card' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            card = deck.remove_card
            expect(card).to eq(card1)
            expect(deck.cards).to eq([card2, card3])
            expect(deck.high_ranking_cards).to eq([card3])
            expect(deck.percent_high_ranking).to eq(50.0)
        end 
    end 
    describe '#add_card' do 
        it 'adds a card' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)

            expect(deck.cards).to eq(cards)
            card4 = Card.new(:club, '5', 5)
            deck.add_card(card4)

            expect(deck.cards).to eq([card1, card2, card3, card4])
        end 
    end 

end 
