require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

describe Game do
  it 'is an instance of Game' do
    game = Game.new

    expect(game).to be_a(Game)
  end

  it 'has a greeting' do
    game = Game.new
    game.greeting

    expect(game.greeting).to eq("Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are Megan and Aurora.\nType 'GO' to start the game!\n------------------------------------------------------------------\n")
  end

  it 'takes user input' do
    game = Game.new
    game.begin_game('begin')

    expect(game.begin_game('begin')).to eq("Invalid response:\nPlease try again and type 'GO'")
  end
end
