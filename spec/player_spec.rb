require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    describe '#initialize' do
        it 'requires cards and decks' do
            card1 = Card.new(:diamond, 'Queen', 12)
            expect(card1).to be_a(Card)
            card2 = Card.new(:spade, '3', 3)
            expect(card2).to be_a(Card)
            card3 = Card.new(:heart, 'Ace', 14)
            expect(card3).to be_a(Card)
            deck = Deck.new([card1, card2, card3])
            expect(deck).to be_a(Deck) 
        end
    end
end