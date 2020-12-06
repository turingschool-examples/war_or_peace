require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/war_or_peace_runner'

class PlayerTest < Minitest::Test

  def test_intro

    intro = "Welcome to War! (or Peace) This game will be played with 52 cards.
      The players today are Megan and Aurora.
      Type 'GO' to start the game!"


      assert_equal intro,  intro

  end

end
