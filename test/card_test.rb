require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'

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

  def test_it_can_have_multiple_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '10', 10)

    assert_instance_of Card, card1
    assert_instance_of Card, card2
  end
end
