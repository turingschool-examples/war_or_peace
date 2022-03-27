require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

RSpec.describe Game do
  it 'exists' do
    game = Game.new('Megan', 'Aurora')

    expect(game).to be_an_instance_of(Game)
  end
end
