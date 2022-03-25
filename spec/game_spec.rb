require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

describe Game do
  it 'exists' do
    game = Game.new('Bryce', 'Stephanie')

    expect(game).to be_a Game
  end

  it 'can start a game' do
    game = Game.new('Bryce', 'Stephanie')
    expect(game).to respond_to :start
  end
end
