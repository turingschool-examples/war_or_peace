require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def setup
  @game = Game.new 
  end

  def test_it_exists_with_attributes
    assert_instance_of Game, @game

    expected1 = [:hearts, :diamonds, :clubs, :spades]
    expected2 = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    expected3 = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

    assert_equal [], @game.deck
    assert_equal expected1, @game.suits
    assert_equal expected2, @game.value
    assert_equal expected3, @game.rank
  end
end
