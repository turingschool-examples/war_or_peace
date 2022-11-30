require './lib/card'
require './lib/deck'

describe Deck do
    describe 'initialize' do
        it 'references the Card class' do
            card1 = Card.new(:diamond, 'Queen', 12)
            expect(card1).to be_a(Card)
            card2 = Card.new(:spade, '3', 3)
            expect(card2).to be_a(Card)
            card3 = Card.new(:heart, 'Ace', 14)
            expect(card3).to be_a(Card)
        end 
        it 'contains multiple cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)

            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck).to be_a(Deck)
        end 
        it 'contains cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)

            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.cards).to eq([card1, card2, card3])
        end
    end
end 