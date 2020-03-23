require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    deck1 = Deck.new([card2])
    deck2 = Deck.new([card1])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_can_start
    skip
    assert_equal
  end

  def test_it_can_take_a_turn
    skip
    assert_equal
  end

end
