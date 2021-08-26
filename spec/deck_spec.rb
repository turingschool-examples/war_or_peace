require 'rspec'
require './lib/deck.rb'
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
    it 'shows the rank of the card' do
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
    it 'return an array of cards ranking 11 or above' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards). to be_an Array
      expect(deck.high_ranking_cards).to eq [card1,card3]
    end
  end
  describe "#percent_high_ranking" do
    it 'return the percentage of high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.percentage_high_ranking).to eq 66.67
  end
end

  describe "#remove_card" do
    it 'can remove a card from top of deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards).to eq [card1, card2, card3]
      expect(deck.remove_card).to eq card1
      expect(deck.cards).to eq [card2, card3]
  end
end
  describe "#add_card" do
    it 'can remove a card from top of deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:club, '5', 5)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.cards). to eq [card1, card2, card3]
      expect(deck.add_card(card3)).to eq [card1, card2, card3, card4]
  end
end

end
