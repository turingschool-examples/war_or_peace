require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"
require "./lib/game"
require "./lib/war_or_peace"

class WarOrPeaceTest < Minitest::Test

  def test_it_exists
    war_or_peace = WarOrPeace.new
    assert_instance_of WarOrPeace, war_or_peace
  end



end
