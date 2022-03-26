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
    card1 = Card.new(:diamond, '2', 2)
    @game = Game.new
    @game.make_deck
    expect(@game.deck_filled.length).to eq(52)
    expect(@game.deck_filled[0]).not_to eq(card1)
  end

  it "checks start_game method" do
  @game = Game.new
  @game.start_game
  expect(@game.deck_filled.length).to eq(52)
  end
end
