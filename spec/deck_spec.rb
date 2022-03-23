require 'rspec'
require './lib/deck'
require './lib/card'

describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Queen', 12)
    @card3 = Card.new(:spade, '3', 3)
    @card4 = Card.new(:heart, 'Ace', 14)
    @sample_cards = [@card1, @card2, @card3, @card4]
    @deck = Deck.new(@sample_cards)
  end

  describe 'Test' do
    it 'it exists' do
      expect(@deck).to be_instance_of(Deck)
    end
    it 'returns rank of card at index' do
      expect(@deck.rank_of_card_at(0)).to eq(12)
      expect(@deck.rank_of_card_at(3)).to eq(14)
    end
    it 'returns high ranking cards' do
      expect(@deck.high_ranking_cards).to eq([@card1, @card2, @card4])
    end
    it 'returns percentage of high ranking cards' do
      expect(@deck.percent_high_ranking).to eq(75)
    end
    it 'can remove a card from the deck' do
      @deck.remove_card
      expect(@deck.cards.length).to eq(3)
    end
    it 'can add a card to the deck' do
      card5 = Card.new(:heart, '10', 10)
      @deck.add_card(card5)
      expect(@deck.cards.length).to eq(5)
    end
  end
end
