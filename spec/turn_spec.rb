
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe 'initialize' do
    it 'exists' do
      turn = Turn.new(player1, player2)    

      expect(turn).to be a Turn
    end
  end
end