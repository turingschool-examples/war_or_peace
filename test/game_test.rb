require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_the_game_generates_a_deck
    game = Game.new
    # game.make_deck

    assert_equal 52, game.deck.count

  end

  def test_the_game_deals_26_cards_to_each_player
    game = Game.new
    # game.make_deck
    game.deal

    assert_equal 26, game.player1.deck.cards.count
    assert_equal 26, game.player2.deck.cards.count

  end

  def test_game_can_take_turns
    game = Game.new
    game.deal
    game.take_turn
    game.take_turn
    game.take_turn

    assert_equal 3, game.round_count
  end


end
