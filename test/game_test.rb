require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn.rb'
require './lib/game.rb'
require "pry"

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_prints_prompt
    game = Game.new
    binding.pry
    assert_equal "Welcome to War! (or Peace) This game will be played with 52 cards.", "The players today are Megan and Aurora.", "Type 'GO' to start the game!", game.start
  end
end
