require 'rspec'
require './lib/deck'
require './lib/player'

describe Player do
  context 'Attributes' do
    it 'is a player' do
      player = Player.new([])
      expect(player).to be_an_instance_of(Player)
    end
  end
end
