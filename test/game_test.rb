require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


class StartTest < MiniTest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_52_cards_are_created
    game = Game.new

    assert_equal 52, game.create_deck_of_shuffled_cards.cards.length
  end

  def test_2_piles_of_26_cards_are_created
    game = Game.new
    game.create_deck_of_shuffled_cards
    cards = game.create_pile_of_cards_for_each_player

    assert_equal 26, cards[0].cards.length
    assert_equal 26, cards[1].cards.length
  end

  def test_2_players_have_26_cards_each
    game = Game.new
    game.create_deck_of_shuffled_cards
    game.create_pile_of_cards_for_each_player
    game.create_two_players
    require "pry"; binding.pry

    assert_equal 26, @player1.deck.cards
  end

end
