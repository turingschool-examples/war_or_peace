require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    context 'Test Set 1' do
        it 'exists' do
            card1 = Card.new(:spades, 'Ace', 14)
            card2 = Card.new(:diamonds, 'Eight', 8)
            card3 = Card.new(:clubs, 'Five', 5)

            cards_arr = [card1, card2, card3]
            deck = Deck.new(cards_arr)
        end
    end

    context 'Test Set 2' do
        it 'can return ranking' do
            card1 = Card.new(:spades, 'Ace', 14)
            card2 = Card.new(:diamonds, 'Eight', 8)
            card3 = Card.new(:clubs, 'Five', 5)

            cards_arr = [card1, card2, card3]
            deck = Deck.new(cards_arr)

            expect(deck.rank_of_card_at(0)).to be(14)
            expect(deck.rank_of_card_at(2)).to be(5)
        end 
    end

    context 'Test Set 3' do
        it 'can remove cards' do
            card1 = Card.new(:spades, 'Ace', 14)
            card2 = Card.new(:diamonds, 'Eight', 8)
            card3 = Card.new(:clubs, 'Five', 5)

            cards_arr = [card1, card2, card3]
            deck = Deck.new(cards_arr)

            expect(deck.remove_card).to eq(card1)
        end

        it 'can add cards' do
            card1 = Card.new(:spades, 'Ace', 14)
            card2 = Card.new(:diamonds, 'Eight', 8)
            card3 = Card.new(:clubs, 'Five', 5)
            card4 = Card.new(:hearts, 'Queen', 12)
            
            cards_arr = [card1, card2, card3]
            deck = Deck.new(cards_arr)

            expect(deck.add_card(card4)).to eq([card1, card2, card3, card4])
        end
    end
end 
  