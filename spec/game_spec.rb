require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  before :each do
    player1 = Player.new("Sally")
    player2 = Player.new("James")
    @game = Game.new(player1, player2)
  end

  it 'it exists' do
    expect(@game).to be_a Game
  end

  it 'has attributes' do
    expect(@game.player1).to be_a Player
    expect(@game.player2).to be_a Player
  end

  it 'can play a game' do
    expect(Game.play).to eq("draw!")
  end
end