require 'rspec'
require './lib/turn'

describe Turn do
  describe '#initialize' do
    it 'has two players' do
      deck_1 = ['placeholder array']
      deck_2 = []
      player1 = Player.new('Nate', deck_1)
      player2 = Player.new('Clarisa', deck_2)

      Turn.new(player1, player2)

      expect(player1.name).to eq('Nate')
      expect(player2.name).to eq('Clarisa')
    end
  end
end
