require 'rspec'
require './lib/deck.rb'
require './lib/card.rb'

describe Deck do
  context 'iteration 1' do
      before :each do
        @card1 = Card.new(:diamond, 'Queen', 12)
        @card2 = Card.new(:spade, '3', 3)
        @card3 = Card.new(:heart, 'Ace', 14)
        @cards = [@card1, @card2, @card3]
        @deck = Deck.new(@cards)

      it "exists " do
        expect(deck).to be_an_instance_of(Deck)
        expect(deck.cards).to eq(cards)
      end

      it "can determine rank of card" do
        expect(deck.rank_of_card_at(0)).to eq(12)
        expect(deck.rank_of_card_at(2)).to eq(14)
      end

      it "return an array of high ranking cards" do
        expect(deck.high_ranking_cards).to eq([card1, card3])
      end

      it "can return percentage of high ranking cards" do
        expect(deck.percent_high_ranking).to eq(66.67)
      end

      it "can remove the top card from the deck" do
        expect(deck.remove_card).to eq(card1)
      end

      it "can add one card to the end of the deck" do
        expect(deck.add_card).to eq(cards << card4)
      end
    end
  end
end
