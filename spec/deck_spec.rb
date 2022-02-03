require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do

  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'King', 13)
    @card3 = Card.new(:heart, '3',3)

    @cards = [@card1,@card2,@card3]

    @deck = Deck.new @cards
  end

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  context "instance_methods" do

    it "rank_of_card_at" do

      expect(@deck.rank_of_card_at(0)).to eq(@card1)
      expect(@deck.rank_of_card_at(1)).to eq(@card2)

    end

    it "high_ranking_cards" do

      expected = [@card1,@card2]

      expect(@deck.high_ranking_cards).to eq(expected)

    end

    it "percent_high_ranking" do

      expected = @deck.high_ranking_cards.count.to_f / @deck.cards.count

      expect(@deck.percent_high_ranking).to eq(expected)

    end

    # it "remove_card" do
    #
    #   expected = @deck.cards.shift
    #
    #   expect(@deck.remove_cards).to eq(expected)
    #
    # end

    it "add_card" do

      expected = @deck.cards.append

      expect(@deck.add_cards).to eq(expected)

    end

  end
end
