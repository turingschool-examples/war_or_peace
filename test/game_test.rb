require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/war_or_peace_runner'

class GameTest < Minitest::Test
  def test_a_game_exists
    new_game = Game.new

  assert_instance_of Game, new_game
  end

  def test_you_can_make_a_deck

    game = Game.new
    deck1 = Deck.new
    player1 = Player.new('Megan', deck1)
    game.new_deck
    require "pry"; binding.pry
    assert_equal 52, game.deck.length
  end
end
