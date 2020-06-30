require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"

class CardTest < Minitest::Test
  def setup
    @card = Card.new(:heart, 'Jack', 11)
  end

  def test_it_exists
    assert_instance_of Card, @card
  end

  def test_it_has_attributes
    assert_equal :heart, @card.suit

    assert_equal "Jack", @card.value

  end

end
