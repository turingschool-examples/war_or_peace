require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

describe Game do
  it "exists" do
    game = Game.new(p1, p2)
    expect(game).to be_a(Game)
  end
end
