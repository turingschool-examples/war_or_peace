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
    # skip
    card = Card.new(:diamond, 'Queen', 12)

    assert_equal :diamond, card.suit
    assert_equal 'Queen', card.rank
    assert_equal 12, card.value
  end

  def test_card_returns_rank
    skip
  end

  def test_is_card_high_ranking
    skip
  end

  def test_what_percentage_high_ranking
    skip
  end

  def test_can_remove_card
    skip
  end

  def can_add_card
    skip
  end
end
