require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './war_or_peace_runner'


class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_card_decks
    game = Game.new
    deck = game.deal_cards

    assert_equal 26, deck1.count

  end

end
