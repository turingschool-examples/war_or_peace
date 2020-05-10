require "minitest/autorun"
require '../lib/card'


class CardTest < Minitest::Test

  def setup
    @card = Card.new(:heart, "Jack", 11)
  end

  def test_it_has_readable_attributes

    assert_equal :heart, @card.suit
    assert_equal "Jack", @card.value
    assert_equal 11, @card.rank
  end
end
