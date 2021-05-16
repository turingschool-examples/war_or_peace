require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

describe Game do
  before :each do
    @turn = Turn.new(@player1, @player2)
    @game = Game.new
  end

  it "exists" do
    expect(@game).to be_an_instance_of(Game)
  end

  it "at first returns an empty array for full_deck" do
    expect(@game.full_deck).to eq([])
  end

  it "full_deck has cards after running deal method" do
    @game.deal

    expect(@game.full_deck.empty?).to eq(false)
  end

end
