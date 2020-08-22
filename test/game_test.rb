require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner'
require './lib/game'


class StartTest < MiniTest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_52_cards_are_created
    game.create_deck_of_shuffled_cards

    assert_equal 52, deck.cards.length
  end

  def test_start_game_method_starts_new_game
    game = Game.new

    expected = "Welcome to War! (or Peace) This game will be played with 52 cards.
  The players today are Megan and Aurora.
  Type 'GO' to start the game!
  ------------------------------------------------------------------"

    assert_equal expected, game.start_game
  end

end
