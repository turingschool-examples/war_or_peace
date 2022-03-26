require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do

  it "exists" do
    @game = Game.new
    expect(@game).to be_an_instance_of(Game)
  end

  it "checks make_deck method" do
    @game = Game.new
    @game.make_deck
    expect(@game.deck_filled.length).to eq(52)
  end
end
