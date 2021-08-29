require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'
require './lib/game'

RSpec.describe Game do

  it 'exists' do
    game1 = Game.new
    expect(game1).to be_an_instance_of(Game)
  end


end
