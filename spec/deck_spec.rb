require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'


describe Deck do
  context 'iteration 1' do
    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck).to be_a(Deck)
      expect(deck.cards).to eq([card1, card2, card3])
    end



    # it 'is an instance of deck' do
    #   deck = Deck.new([])
    #   expect(deck.cards).to be_empty
    # end

    # it 'can create a deck with cards' do
    #   card1 = Card.new(:diamond, 'Queen', 12)
    #   card2 = Card.new(:spade, '3', 3)
    #   card3 = Card.new(:heart, 'Ace', 14)
    #   cards = [card1, card2, card3]
    #   deck = Deck.new(cards)
    # end

    it 'has a rank' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    xit 'has a high rank' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end
end
