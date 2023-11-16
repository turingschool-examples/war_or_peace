require "./lib/card"
require "./lib/deck"

RSpec.describe Deck do
  let!(:card1) { Card.new(:diamond, "Queen", 12) }
  let!(:card2) { Card.new(:spade, "3", 3) }
  let!(:card3) { Card.new(:heart, "Ace", 14) }
  let!(:card4) { Card.new(:club, "5", 5) }
  let!(:deck) { Deck.new([card1, card2, card3]) }

  it "exists" do
    expect(deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    expect(deck.cards).to eq([card1, card2, card3])
  end

  it "#rank_of_card_at" do
    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.rank_of_card_at(2)).to eq(14)
  end

  it "#high_ranking_cards" do
    expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "#percent_high_ranking" do
    expect(deck.percent_high_ranking).to eq(66.67)
  end

  it "#remove_card" do
    expect(deck.remove_card).to eq(card1)
    expect(deck.cards).to eq([card2, card3])
    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(50.0)
  end

  it "#add_card" do
    deck.remove_card
    deck.add_card(card4)

    expect(deck.cards).to eq([card2, card3, card4])
    expect(deck.high_ranking_cards).to eq([card3])
    expect(deck.percent_high_ranking).to eq(33.33)
  end
end