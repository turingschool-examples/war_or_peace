require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    card = Card.new(:diamond, 'Queen', 12)
  end

  def test_it_exists
    card = Card.new(:diamond, 'Queen', 12)

    assert_instance_of Card, card
  end

  def test_it_has_readable_attributes
    card = Card.new(:diamond, 'Queen', 12)

    assert_equal :diamond, card.suit
    assert_equal 'Queen', card.value
    assert_equal 12, card.rank
  end

  def test_it_can_have_different_card
    card = Card.new(:heart, 'Jack', 11)

    assert_equal :heart, card.suit
    assert_equal 'Jack', card.value
    assert_equal 11, card.rank
  end
end
