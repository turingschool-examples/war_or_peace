require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    card = Card.new(:heart, 'Jack', 11)
  end

  def test_it_exists
    card = Card.new(:heart, 'Jack', 11)

    assert_instance_of Card, card
  end

  def test_it_has_readable_attributes
    card = Card.new(:heart, 'Jack', 11)

    assert_equal :heart, card.suit
    assert_equal 'Jack', card.value
    assert_equal 11, card.rank
  end
end
