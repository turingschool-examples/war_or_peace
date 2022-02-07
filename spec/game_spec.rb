require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do

  it 'determining correct winner when player1 starts with high card' do

    cards1 = [Card.new(:heart, '7', 7)]
    cards2 = [Card.new(:spade, '6', 6)]

    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    new_game = Game.new(player1, player2)

    expect{new_game.play_game}.to output("Turn 1: Megan won 2 cards\n*~* Megan has won the game! *~*\n").to_stdout
  end

end
