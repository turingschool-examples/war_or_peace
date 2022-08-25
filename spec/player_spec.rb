require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
    it 'exists' do
        player = Player.new(Deck)
        expect(player).to be_an_instance_of(Player)
    end
end

