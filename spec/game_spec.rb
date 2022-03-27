require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  it "exist" do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it "has attributes" do
    game = Game.new
    expect(game.standard_deck).to eq([])
  end

  it "has turn count set to '0' by default" do
    game = Game.new
    expect(game.count).to eq(0)
  end
end
