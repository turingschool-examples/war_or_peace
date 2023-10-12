require "./lib/card"
require "./lib/deck"
require "./lib/player"

RSpec.describe Player do
  let!(:card1) { Card.new(:diamond, "Queen", 12) }
  let!(:card2) { Card.new(:space, "3", 3) }
  let!(:card3) { Card.new(:heart, "Ace", 14) }
  let!(:deck) { Deck.new([card1, card2, card3]) }
  let!(:player1) { Player.new("Clarissa", deck) }

  it "exists" do
    expect(player1).to be_an_instance_of(Player)
  end

  it "has readable attributes" do
    expect(player1.name).to eq("Clarissa")
    expect(player1.deck).to eq(deck)
  end

  it "#has_lost?" do
    expect(player1.has_lost?).to eq(false)
    player1.deck.remove_card
    expect(player1.has_lost?).to eq(false)
    player1.deck.remove_card
    expect(player1.has_lost?).to eq(false)
    player1.deck.remove_card
    expect(player1.has_lost?).to eq(true)
    expect(player1.deck.cards).to eq([])
  end
end