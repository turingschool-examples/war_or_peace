require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
# require './lib/war_or_peace_runner'

class GameTest < Minitest::Test
  def test_a_game_exists
    deck1 = Deck.new
    deck2 = Deck.new
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    new_game = Game.new(turn)

  assert_instance_of Game, new_game
  end
#
  def test_you_can_return_a_winner
    skip
    deck1 = Deck.new
    deck2 = Deck.new
    deck1.new_deck
    deck2.new_deck
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    new_game = Game.new(turn)
    # new_game = Game.new(turn1)
    # require "pry"; binding.pry
  assert_equal 5, new_game.start
  end
end
