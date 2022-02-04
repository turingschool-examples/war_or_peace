require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    @deck = Deck.new(cards)
  end

  it "exists" do

    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do

     expect(@deck.rank_of_card_at(0)).to eq(12)
     expect(@deck.rank_of_card_at(2)).to eq(14)

   end

   it "has cards" do

     cards_in_deck = (@deck.cards).length
     expect(cards_in_deck).to eq(3)

   end
    it "has high ranking cards" do

      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heard, 'Ace', 14)
      high_rank = [@deck.cards[0], @deck.cards[2]]
      expect(@deck.high_ranking_cards).to eq(high_rank)
    end

    it "percent_high_ranking" do
        @deck.high_ranking_cards
        expect(@deck.percent_high_ranking).to eq(66.67)
    end

    it "remove_card" do
      removed_card = @deck.cards[0]
      expect(@deck.remove_card).to eq(removed_card)
    end

    xit "add_card" do
      card4 = Card.new(:club, '5', 5)
      @deck.add_card(card4)

      expect(@deck.cards).to eq
    end

end
