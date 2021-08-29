require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './war_or_peace_runner'


RSpec.describe Game do
  it 'exists' do
    deck1 = []
    deck2 = []
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    game1 = Game.new(player1, player2)

    expect(game1).to be_a(Game)
  end

  it '' do
    deck1 = []
    deck2 = []
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    game1 = Game.new(player1, player2)

    expect().to eq()
  end
end
