require 'rspec'
require 'pry'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  it 'it exists' do
    game = Game.new
    expect(game).to be_a Game
  end
end