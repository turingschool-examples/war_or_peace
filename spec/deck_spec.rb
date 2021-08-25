require 'rspec'
require './lib/deck2'
require './lib/card'

describe Deck do
  describe '#initialize' do
    it 'is an instance of deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck).to be_a Deck
    end
  end
  describe '#rank_of_card_at' do
    it 'will return rank of card at index' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq 12
      expect(deck.rank_of_card_at(2)).to eq 14
    end
  end

  describe '#high_ranking_cards' do
    it 'creates a new array with cards rank 11 or higher' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to eq [card1, card3]
    end
  end

  describe '#percent_high_ranking' do
    it 'will return percentage of high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq 66.67
    end
  end

  describe 'remove_card' do
    it 'will remove top card of the deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.remove_card).to eq card1
    end
  end

  describe 'add_card' do
    it 'will add a card to the bottom(end) of the deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)
      expect(deck.add_card(card4)).to eq cards
    end
  end

  describe 'cards' do
    it 'will show all the cards in the deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)
      expect(deck.cards).to eq cards
    end
  end

  describe '#high_ranking_cards' do
    it 'creates a new array with cards rank 11 or higher' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)
      expect(deck.high_ranking_cards).to eq [card1, card3]
    end
  end

  describe '#percent_high_ranking' do
    it 'will return percentage of high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      card4 = Card.new(:club, '5', 5)
      deck.add_card(card4)
      deck.remove_card
      expect(deck.percent_high_ranking).to eq 33.33
    end
  end
end
