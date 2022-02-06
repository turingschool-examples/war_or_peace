require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './war_or_peace_runner'

Rspec.describe Game do

  it 'prints turn' do
    expect(turn).to be_an_instance_of(Turn)
  end
end
