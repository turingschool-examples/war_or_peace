require 'rspec'
require './lib/player'
require './lib/deck'
require './lib/card'


RSpec.describe Player do

  describe '#initialize' do
    it "exits" do
      player = Player.new(@deck)

      expect(player).to be_an_instance_of(Player)
    end
  end

  describe '#name' do
    it "has a name" do
      player = Player.new("Clarisa", @deck)

      expect(player.name).to eq("Clarisa")
    end
  end

  describe '#has_lost?' do
    it 'has lost' do
      player = Player.new("Clarisa", @deck)

      expect(player.lost).to eq(false)
    end
  end
end
