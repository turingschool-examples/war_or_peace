require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
    @cards = [@card1, @card2, @card3]
  end

  it "exists" do
    deck = Deck.new(@cards)
    expect(deck).to be_an_instance_of(Deck)
  end

describe "#rank_of_card_at" do
  it "return rank of card" do
    deck = Deck.new(@cards)
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end
end

describe "#high_ranking_cards" do
  it "return an array of face cards and aces" do
    deck = Deck.new(@cards)
    expect(deck.high_ranking_cards).to match([@card1, @card3])
  end
end

describe "#percent_high_ranking" do
  it "return the percentage of face cards and aces" do
    deck = Deck.new(@cards)
    expect(deck.percent_high_ranking).to be(66.67)
  end
end

describe "#remove_card" do
  it "remove the top card from the deck" do
    deck = Deck.new(@cards)
    expect(deck.remove_card).to be(@card1)
    expect(deck.cards).to match([@card2, @card3])
    expect(deck.high_ranking_cards).to match([@card3])
    expect(deck.percent_high_ranking).to be(50.0)
  end
end

describe "#add_card" do
  it "add one card to the bottom (end) of the deck" do
    deck = Deck.new(@cards)
    deck.remove_card
    deck.add_card(@card4)

    expect(deck.cards).to match([@card2, @card3, @card4])
    expect(deck.high_ranking_cards).to match([@card3])
    expect(deck.percent_high_ranking).to be(33.33)
  end
end

end
