require 'rspec'
require './lib/deck'
require './lib/card'

describe 'deck' do
  it 'exists and has readable attribute' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck).to be_an_instance_of Deck
    expect(deck.cards).to eq cards
  end

  describe '#rank of card at' do
    it 'returns rank of card at given index' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq 12
      expect(deck.rank_of_card_at(2)).to eq 14
    end
    describe '#high ranking cards' do
      it 'returns an array of high ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)


        expect(deck.high_ranking_cards).to eq [card1, card3]
      end
    end

    describe '#percent high ranking' do

      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      it 'returns percent of high ranking cards' do
        expect(deck.percent_high_ranking).to eq 2/3
      end
    end
      describe 'Remove card' do
        it 'removes card from array of cards and returns the array' do
          card1 = Card.new(:diamond, 'Queen', 12)
          card2 = Card.new(:spade, '3', 3)
          card3 = Card.new(:heart, 'Ace', 14)

          cards = [card1, card2, card3]
          deck = Deck.new(cards)
          expect(deck.remove_card(card1).length).to eq 2
        end
    end
  end
end
