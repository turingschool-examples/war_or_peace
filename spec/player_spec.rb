require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Player do
    describe'initialize' do
        it 'exists' do
            player = Player.new(@deck)
            expect(player).to be_an_instance_of(Player)
        end

        it ''


    end
end