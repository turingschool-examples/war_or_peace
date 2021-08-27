require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  before :each do
    @card1 = Card.new(:diamond, 'Q', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'A', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  it "has a name" do
    expect(@player.name).to eq('Clarisa')
  end

  it "has a deck" do
    expect(@player.deck).to eq(@deck)
  end

  it "knows if it has lost" do
    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)

    @player.deck.remove_card
    expect(@player.has_lost?).to eq(true)
  end
end
