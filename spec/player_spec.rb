require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  let(:card1){Card.new(:diamond, 'Queen', 12)}
  let(:card2){Card.new(:spade, '3', 3)}
  let(:card3){Card.new(:heart, 'Ace', 14)}
  let(:card4){Card.new(:club, '5', 5)}
  let(:deck){Deck.new([card1, card2, card3])}
  let(:player){Player.new('Clarisa', deck)}

  it "has a name" do
    expect(player.name).to eq('Clarisa')
  end

  it "has a deck" do
    expect(player.deck).to eq(deck)
    # binding.pry

  end

  it "has lost" do
    expect(player.has_lost?).to eq(false)
  end

  it "can lose" do
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    player.deck.remove_card
    expect(player.has_lost?).to eq(true)
    expect(player.deck).to eq(deck {@cards = []})

  end
end
