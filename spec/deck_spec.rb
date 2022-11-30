require './lib/card'
require './lib/deck'

describe Deck do
    describe '#initialize' do
        it 'references the Card class' do
            card1 = Card.new(:diamond, 'Queen', 12)
            expect(card1).to be_a(Card)
            card2 = Card.new(:spade, '3', 3)
            expect(card2).to be_a(Card)
            card3 = Card.new(:heart, 'Ace', 14)
            expect(card3).to be_a(Card)
        end 
        it 'is an instance of Deck' do
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

    describe '#rank_of_card_at' do
        it 'identifies the rank of the card' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)

            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.rank_of_card_at(0)).to eq(12)
            expect(deck.rank_of_card_at(2)).to eq(14)
            expect(deck.cards).to eq([card1, card2, card3])
        end 
    end 

    describe '#high_ranking_cards' do
        it 'pulls the cards ranked 11 or above' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)

            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.high_ranking_cards).to eq([card1, card3])
        end 
    end 

    describe '#percent_high_ranking' do
        it 'calculates the percent of high ranking cards' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)

            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.percent_high_ranking).to eq(66.67)
        end 
    end 

    describe '#remove_card' do
        it 'removes the top card and returns it' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)

            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            expect(deck.remove_card).to eq(card1)
            expect(deck.cards).to eq([card2, card3])
            expect(deck.high_ranking_cards).to eq([card3])
            expect(deck.percent_high_ranking).to eq(50.0)
        end 
    end 

    describe '#add_card' do
        it 'adds a card to the bottom of the deck' do
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            card4 = Card.new(:club, '5', 5)

            cards = [card1, card2, card3]
            deck = Deck.new(cards)
            deck.remove_card
            deck.add_card(card4)
            expect(deck.cards).to eq([card2, card3, card4])
            expect(deck.high_ranking_cards).to eq([card3])
            expect(deck.percent_high_ranking).to eq(33.33)
        end 
    end 
end 