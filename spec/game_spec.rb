require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/game'
require './lib/turn'
require './lib/game'

describe Game do
  describe '#initialize' do
    it 'exists' do
      game = Game.new

      expect(game).to be_a(Game)
    end
  end

  describe '#full_deck' do
    it 'has full_deck' do
      game = Game.new

      expect(game.full_deck.count).to eq(52)
    end
  end
  
end