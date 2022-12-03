require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/game'
require './lib/turn'
require './lib/game'

describe Game do
  describe '#initialize' do
    it 'exists and has empty full_deck' do
      game = Game.new

      expect(game).to be_a(Game)
      expect(game.full_deck).to eq([])
    end
  end
end