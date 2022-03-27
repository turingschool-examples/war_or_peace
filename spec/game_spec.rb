require 'rspec'
require './lib/game'
require './lib/war_or_peace'
require 'pry'

describe Game do
  it "initializes the game war" do
    unshuffled_cards = Deck.new
    deck1 = Deck.new([0..25])
    deck2 = Deck.new([26..52])
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    game = Game.new(player1, player2)
    winner = turn.winner

    expect(game).to be_an_instance_of(Game)
  end

  it "splits deck into deck1 and deck2" do

  end
end
