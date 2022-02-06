require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './war_or_peace_runner'

RSpec.describe Game do

  it 'prints turn' do
    new_game = Game.new

    expect{new_game.start_game}.to output("Turn 1:\n").to_stdout
  end
end
