require 'spec_helper'

RSpec.describe 'iteration 1' do
  context Deck do
    before(:all) do
      @card1 = Card.new(:diamond, 'Queen', 12)
      @card2 = Card.new(:spade, '3', 3)
      @card3 = Card.new(:heart, 'Ace', 14)
      @cards = [@card1, @card2, @card3]
      @deck = Deck.new(@cards)
    end

    context '#initialize' do
      it 'exists' do
        expect(@deck).to be_an_instance_of(Deck)
      end

      it 'has cards' do
        expect(@deck.cards).to be_truthy
      end
    end

    context '#rank_of_card_at' do
      it 'returns the rank of the card at a given index' do
        expect(@deck.rank_of_card_at(0)).to eq(12)
        expect(@deck.rank_of_card_at(2)).to eq(14)
      end
    end

    context '#high_ranking_cards' do

      it 'retrieves cards valued 11 or higher' do
        expected = []

        @deck.cards.each do |card|
          expected << card if card.rank >= 11
        end
        expect(@deck.high_ranking_cards).to eq(expected)
      end

    end

    context '#percent_high_ranking' do
      it 'calculates the percentage of high ranking cards' do
        expected = (2/ 3.0 * 100).ceil(2)
        expect(@deck.percent_high_ranking).to eq(expected)
      end
    end

    context '#remove_card' do
      it 'returns the card removed' do
        expect(@deck.remove_card).to eq(@card1)
        expect(@deck.cards).to eq([@card2, @card3])
      end
      it 'updates the cards in the deck' do
        expect(@deck.cards).to eq([@card2, @card3])
        expect(@deck.high_ranking_cards).to eq([@card3])
        expect(@deck.percent_high_ranking).to eq(50.0)
      end
    end

    context '#add_card' do
      before(:all) do
        @card4 = Card.new(:club, '5', 5)
      end

      it 'adds a card to the deck' do
        expect(@deck.add_card(@card4)).to eq(@cards)
        expect(@deck.high_ranking_cards).to eq([@card3])
        expect(@deck.percent_high_ranking).to eq(33.33)
      end
    end
  end
end

