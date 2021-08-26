require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do

  describe '#initialize' do
    it 'is an an instance of deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2=  Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '8', 8)

      cards = [card1, card2, card3]

      deck = Deck.new(cards)

      expect(deck).to be_a Deck
    end
    it "has readable attributes" do

      card1 = Card.new(:diamond, 'Queen', 12)
      card2=  Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '8', 8)

      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(cards).to be_an Array
      expect(cards[0]).to be_a Card
    end
  end

    describe '#rank_of_card_at' do
      it 'returns the rank of a card' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2=  Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '8', 8)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect(card1.rank).to eq 12
      end
    end

    describe '#high_ranking_cards' do
      it 'returns array of high-ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2=  Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '8', 8)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect(card2.rank < 11).to be true
      end
    end

    describe '#percent_high_ranking' do
      it 'calculates percent of high-ranking cards' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2=  Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:club, '8', 8)

        cards = [card1, card2, card3]
        deck = Deck.new(cards)

        expect(high_count).to eq 2
      end
    end

  describe '#remove_card' do
    it 'removes a card from the array' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2=  Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '8', 8)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(cards.length).to eq 3
    end
  end

  describe '#add_card' do
    it 'adds a card to the array' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2=  Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '8', 8)

      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(cards.length).to eq 4
    end
  end
end
