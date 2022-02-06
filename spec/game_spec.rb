require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/standard_deck'

RSpec.describe Game do
  new_game = Game.new

  it 'exists' do
    new_game.start
    expect(new_game).to be_an_instance_of Game
  end

  xit 'shuffles and deals deck' do
    expect(card_split_1.count).to eq(26)
    expect(card_split_2.count).to eq(26)
  end

  xit 'has players' do
    new_game.start
    expect(new_game.player1.name).to eq("Megan")
    expect(new_game.player2.name).to eq("Aurora")
  end

end
