require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

describe Player do
  it "is a player" do
    player = Player.new('Clarisa', 'deck')

    expect(player).to be_an_instance_of(Player)
  end
end
