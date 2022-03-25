require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


RSpec.describe Game do

  it "exists" do
    expect(Game.new).to be_an_instance_of(Game)
  end

  it "creates a deck" do
    game = Game.new
    game.create_deck


    expect(game.standard_deck.length).to eq(52)
  end

  it "splits the deck into two" do
    game = Game.new
    game.create_deck
    game.split_deck

    expect(game.deck1.cards.length).to eq(26)
    expect(game.deck2.cards.length).to eq(26)
  end

  xit "starts the game"
    game = Game.new
    game.create_deck
    game.split_deck
    game.start_turns
  end 
end
