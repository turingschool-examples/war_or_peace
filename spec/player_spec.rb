require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  before do
    @player = Player.new('Player', Deck.new([Card.new(:foo, 'Bar', 1)]))
  end

  it "exists" do
    expect(@player).to be_an_instance_of(Player)
  end

  it "has readable attributes" do
    expect(@player.deck).to be_an_instance_of(Deck)
  end

  it "returns true if lost" do
    loser = Player.new('Loser', Deck.new([Card.new(:foo, 'Bar', 0)]))
    expect(loser.has_lost?).to eq(false)
    loser.deck.remove_card_from_top
    expect(loser.has_lost?).to eq(true)

    loser.deck.add_card_to_bottom(Card.new(:foo, 'Bar', 0))
    loser.deck.add_card_to_bottom(Card.new(:foo, 'Bar', 0))
    expect(loser.has_lost?).to eq(false)

    loser.deck.remove_card_from_top
    loser.deck.remove_card_from_top
    expect(loser.has_lost?).to eq(true)
  end

end
