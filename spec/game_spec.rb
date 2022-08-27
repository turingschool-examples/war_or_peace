require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
    it 'it exists' do
        game = Game.new
        expect(game).to be_an_instance_of(Game)
    end
end