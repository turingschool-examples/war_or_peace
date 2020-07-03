require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './war_or_peace_runner'
require "pry"

class GameTest < Minitest::Test
  def test_a_game_exists
    game = Game.new()
    assert_instance_of Game, game
  end

  def test_deck_creation
    game = Game.new()
    full_deck = game.create_deck
    assert_equal 52, full_deck.size
  end

  def test_split_and_create_decks
    game = Game.new
    shuffled_deck = game.split_and_create_decks
    refute_equal shuffled_deck, game.create_deck
  end

  def test_players_created
    game = Game.new
    player1 = game.create_players[0]
    player2 = game.create_players[1]
    assert_equal player1.name, "Megan"
  end

  def test_create_turn
    game = Game.new()
    turn = game.create_turn
    assert_equal turn.player2.name, "Aurora"
  end

  def test_game
    game = Game.new
    game.start
  end
end
