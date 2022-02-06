require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

RSpec.describe Game do
  new_game = Game.new

  it 'exists' do
    new_game.start
    expect(new_game).to be_an_instance_of Game
  end


  it 'has players' do
    new_game.start
    expect(new_game.player1.name).to eq("Megan")
    expect(new_game.player2.name).to eq("Aurora")
  end

end
