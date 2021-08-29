require './lib/game'

describe Game do
  describe '#initialize' do
    it 'gives each player a deck of 26 cards' do
      game = Game.new
      expect(game.deck1.cards.count).to eq(26)
      expect(game.deck2.cards.count).to eq(26)
    end
  end
end
