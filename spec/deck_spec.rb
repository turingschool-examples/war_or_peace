require './lib/deck'
require './lib/card'

describe Deck do
    it 'exists' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck).to be_an_instance_of(Deck)
    end

    it 'has cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]

        deck = Deck.new(cards)

        expect(deck.cards).to eq([card1, card2, card3])
    end

    it 'rank of cards'


end