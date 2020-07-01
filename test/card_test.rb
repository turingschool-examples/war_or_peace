require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

#The tests are failing because there is no Card class (yet?)
class CardTest < Minitest::Test
  def setup
    card = Card.new(:diamond, 'Queen', 12) # we have to define the suits using :suit_name?
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
end
