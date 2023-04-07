# require 'rspec'
# require './lib/deck'
# require './lib/card'
require 'spec_helper'

RSpec.describe Deck do
  # describe '#initialize' do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '2', 2)
    @array_of_cards = [@card1, @card2, @card3]
    @deck = Deck.new(@array_of_cards)
  end
  it 'exists' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'has cards' do
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end
  # end

  describe '#rank_of_card_at' do
    it 'returns the rank of the card at a given index' do
      expect(@deck.rank_of_card_at(0)).to eq(12)
      expect(@deck.rank_of_card_at(2)).to eq(14)
    end
  end

  describe '#high_ranking_cards' do
    it 'retrieves cards valued 11 or higher' do
      expected = []

      @deck.cards.each do |card|
        expected << card if card.rank >= 11
      end
      expect(@deck.high_ranking_cards).to eq(expected)
    end
  end

  describe '#percent_high_ranking' do
    it 'calculates the percentage of high ranking cards' do
      expected = (2 / 3.0 * 100).ceil(2)
      expect(@deck.percent_high_ranking).to eq(expected)
    end
  end

  describe '#remove_card' do
    it 'returns the card removed' do
      expect(@deck.remove_card).to eq(@card1)
      expect(@deck.cards).to eq([@card2, @card3])
    end

    it 'updates the cards in the deck' do
      expect(@deck.cards).to eq([@card1, @card2, @card3])
      expect(@deck.high_ranking_cards).to eq([@card1, @card3])
      expect(@deck.percent_high_ranking).to eq(66.67)
    end
  end

  describe '#add_card' do
    it 'adds a card to the deck' do
      expect(@deck).to be_a Deck
      @deck.cards.each do |card|
        expect(card).to be_a Card
      end
      expect(@deck.add_card(@card4)).to eq(@array_of_cards)
      @deck.cards.each do |card|
        expect(card).to be_a Card
      end
      expect(@deck.cards).not_to be_nil
      expect(@deck.high_ranking_cards).to eq([@card1, @card3])
      expect(@deck.percent_high_ranking).to eq(50.00)
    end
  end
end
