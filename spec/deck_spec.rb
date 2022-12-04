require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
    describe 'initialize' do
        it 'exists' do
            deck = Deck.new([])
            expect(deck).to be_an_instance_of(Deck)
        end

        it 'can add cards to deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
        
            expect(deck.cards).to eq([card1, card2, card3])
        end

        it 'identifies card rank at index' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)

            expect(deck.rank_of_card_at(0)).to eq(12)
            expect(deck.rank_of_card_at(2)).to eq(14)
        end

        it 'finds high ranking cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)

            expect(deck.high_ranking_cards).to eq([card1, card3])
            # require 'pry'; binding.pry
        end

        it 'gives percent of  high ranking cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            # require 'pry';binding.pry
            expect(deck.percent_high_ranking).to eq(66.67)
            # require 'pry';binding.pry
        end
        
        it 'removes first card of deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)

            expect(deck.remove_card).to eq(card1)
        end


        it 'adds a card to the end of the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            card4 = Card.new(:club, '5', 5)
            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            
            deck.remove_card
            deck.add_card(card4)

            expect(deck.cards).to eq([card2, card3, card4])
        end
    end
end