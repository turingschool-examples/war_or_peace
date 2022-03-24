require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

describe Deck do

    xit 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(card1).to be_an_instance_of(Card)
      expect(deck).to be_an_instance_of(Deck)
    end

    xit 'rank of card at' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq (12)
    end

    xit 'are high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      expect(deck.high_ranking_cards).to eq([card1, card3]) #Not sure what to make it equal to yet 3/23
    end

    it 'percent of high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])
      expect(deck.percent_high_ranking).to eq (66)
    end
end
