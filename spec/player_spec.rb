require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'
card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
deck = Deck.new([card1, card2, card3])
player = Player.new('Clarisa', deck)

RSpec.describe Player do

  it "exists" do
    expect(player).to be_an_instance_of(Player)
  end

  it "prints player name" do
    expect(player.name).to eq('Clarisa')
  end

  it "shows the player's deck" do
    expect(player.deck).to eq(deck)
  end

  it "determines whether player lost" do
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    # binding.pry
    expect(player.has_lost?).to eq(true)
  end

  it "shows the empty deck" do
    expect(player.deck.cards).to eq([])
  end


end
