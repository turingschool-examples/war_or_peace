require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

RSpec.describe Game do
  it "exists" do
    deck1 = []
    deck2 = []
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    game = Game.new(player1, player2)
    expect(game).to be_an_instance_of(Game)
  end

  it "can create a standard deck of 52 cards" do
    deck1 = []
    deck2 = []
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    game = Game.new(player1, player2)
    standard_deck = []
    expect(game.create_deck).to eq(game.standard_deck)
    expect(game.standard_deck.cards.count).to eq(52)
  end
end
