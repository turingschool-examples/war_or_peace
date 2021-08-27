require 'rspec'
require './lib/deck'
require './lib/card'
require './spec/card_spec'

RSpec.describe Deck do
  describe '#initialize' do
    it 'accept array' do
      deck = Deck.new([])
      expect(deck).to be_a(Deck)
    end
  end

  describe '#cards' do
    it 'read card attribute' do
      card = Card.new(:diamond, 'Queen', 12)
      deck = Deck.new([card])
      expect(deck.cards).to eq([card])
    end
  end

  describe '#rank_of_card_at' do
    it 'put card rank' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq(card1.rank)
      expect(deck.rank_of_card_at(2)).to eq(card3.rank)
    end
  end

  describe '#high_ranking_cards' do
    it 'identify high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.high_ranking_cards.include?(card1)).to eq(true)
      expect(deck.high_ranking_cards.include?(card2)).to eq(false)
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end
  end

  describe '#percent_high_ranking' do
    it 'return percentage of high ranking cards' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq(66.67)
    end
  end

    describe '#remove_card' do
       it 'removes card from deck' do
       card1 = Card.new(:diamond, 'Queen', 12)
       card2 = Card.new(:spade, '3', 3)
       card3 = Card.new(:heart, 'Ace', 14)
       cards = [card1, card2, card3]
       deck = Deck.new(cards)
       expect(deck.remove_card).to eq(card1)
    end
   end

   describe '#add_card' do
     it 'adds new card to deck' do
       card2 = Card.new(:spade, '3', 3)
       card3 = Card.new(:heart, 'Ace', 14)
       card4 = Card.new(:club, '5', 5)
       cards = [card2, card3, card4]
       deck = Deck.new(cards)
       expect(deck.add_card(card4)).to include(card4)
    end
  end
end
