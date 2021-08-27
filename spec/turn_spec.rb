require 'rspec'
require './lib/turn'
require './lib/player'
require './lib/deck'
require '.lib/card'

describe Turn do

  describe '#initialize' do
    it is 'an insance of deck' do
      turn = Turn.new('Clarisa', 'Greg')

      expect(turn).to be_a Turn
    end

    it 'has readable attributes' do

      turn = Turn.new('Clarisa', 'Greg')
      expect(player1).to be_a Player
      expect(player2).to be_a Player
    end
  end
end
