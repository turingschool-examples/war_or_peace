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

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_readable_attributes
    assert_instance_of StandardDeck, @game.standard_deck
  end

  def test_split_deck
    @game.split_deck

    assert_instance_of Deck, @game.deck1
    assert_instance_of Deck, @game.deck2
    assert_equal 26, @game.deck1.cards.count
    assert_equal 26, @game.deck2.cards.count
  end

  def test_create_two_players
    @game.create_two_players("Angel", "Chris")

    assert_instance_of Player, @game.player1
    assert_instance_of Player, @game.player2
  end
end
