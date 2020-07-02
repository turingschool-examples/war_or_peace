require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"

class StandardDeckTest < Minitest::Test

  def test_it_exists
    standard_deck = StandardDeck.new
    assert_instance_of StandardDeck, standard_deck
  end

  #def test_it_has_attributes
  #end

end
