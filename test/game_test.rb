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
