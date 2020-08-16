require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'

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

  def test_has_a_suit
    card = Card.new(:diamond, 'Queen', 12)

    assert_equal :diamond, card.suit
  end

  def test_has_a_value
    card = Card.new(:diamond, 'Queen', 12)

    assert_equal 'Queen', card.value
  end

  def test_has_a_rank
    card = Card.new(:diamond, 'Queen', 12)

    assert_equal 12, card.rank
  end
end
