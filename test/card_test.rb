require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    @card = Card.new(:heart, 'Jack', 11)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Card, @card
    assert_equal :heart, @card.suit
    assert_equal "Jack", @card.value
    assert_equal 11, @card.rank
  end
end
