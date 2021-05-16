require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
  end

  context 'Attributes' do
    it 'are a deck with parameters' do

      expect(@deck).to be_an_instance_of(Deck)
      expect(@deck.cards).to eq([@card1, @card2, @card3])
    end
  end

  context 'Methods' do
    it 'returns card rank by index position' do

      expect(@deck.rank_of_card_at(0)).to eq(12)
      expect(@deck.rank_of_card_at(2)).to eq(14)
    end

    it 'returns high ranking cards' do

      expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    end

    it 'returns percent high ranking cards' do

      expect(@deck.percent_high_ranking).to eq(66.67)
    end

    it 'remove card from top of deck' do
      @deck.remove_card

      expect(@deck.cards).to eq([@card2, @card3])
    end

    it 'add card to bottom of deck' do
      card4 = Card.new(:club, '5', 5)
      @deck.add_card(card4)
      
      expect(@deck.cards).to eq([@card1, @card2, @card3, card4])
    end
  end
end
