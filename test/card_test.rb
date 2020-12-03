require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    card = Card.new(:diamond, 'Queen', 12)
  end

  def test_it_exists
    #Setup
    card = Card.new(:diamond, 'Queen', 12)
    #Execution is card
    #Assertion is assert_instance_of
    assert_instance_of Card, card
    #Teardown is how the test will refresh the things it tested
  end

  def test_it_has_readable_attributes
    card = Card.new(:diamond, 'Queen', 12)

    assert_equal :diamond, card.suit
    assert_equal 'Queen', card.value
    assert_equal 12, card.rank
  end
end
