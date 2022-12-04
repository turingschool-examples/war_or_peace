require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    describe'initialize' do
        it 'exists' do
            deck = Deck.new(@cards)
            expect(deck).to be_an_instance_of(Deck)
        end

        it 'has atributes' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck).to be_an_instance_of(Deck)
        end

        it 'determintes the rank of the card' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.rank_of_card_at(0)).to eq(12)
            expect(deck.rank_of_card_at(2)).to eq(14)
        end
    
        it 'shows us the high ranking cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])  
        end

        it 'shows us the percent of high ranking cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
        end

        it 'deletes the top card from our array' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            card4 = Card.new(:club, '5', 5)
            cards = [card1, card2, card3, card4]
            deck = Deck.new(cards)
            expect(deck.remove_card).to eq(card1)
        end

        it 'Adds card to the bottom of our deck' do
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






