require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class  GameTest <  Minitest::Test
  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_can_build_a_deck_and_split_it
    game = Game.new
    all_cards = game.build_cards
    deck_1, deck_2 = game.split_deck(all_cards)

    assert_equal 52, game.build_cards.count
    assert_equal 26, deck_1.cards.count
    assert_equal 26, deck_2.cards.count
  end
end
