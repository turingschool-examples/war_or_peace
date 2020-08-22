require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_it_can_prepare_deck
    @game.prepare_deck

    assert_equal 26, @game.deck1.cards.length
    assert_equal 26, @game.deck2.cards.length
  end

  def test_it_can_deal_cards
    @game.prepare_deck
    @game.deal_cards("Nick", "Arnold Schwarzenegger")

    assert_instance_of Player, @game.player1
    assert_instance_of Player, @game.player2
  end
end
