require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"

class StandardDeckTest < Minitest::Test

  def setup
    @standard_deck = StandardDeck.new
  end

  def test_it_exists
    assert_instance_of StandardDeck, @standard_deck
  end

  def test_it_can_create_a_deck
    assert_equal 52, @standard_deck.cards.count

  end

end
