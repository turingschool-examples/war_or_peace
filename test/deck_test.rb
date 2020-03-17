require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'

class DeckTest < Minitest::Test
  def setup
    first = [1,2,3,4,5,6]
    deck = Deck.new(first)
  end

  def test_it_exists
    skip
    deck = Deck.new(first)
    assert_instance_of deck, Deck.new
  end

  def test_it_will_index
    skip
    rank = Deck.rank_of_card_at (2)
    assert_equal :rank, deck.rank
  end

  def test_it_has_readable_attributes
skip
    deck = Deck.new
        deck = Deck.new(first, 2)

    assert_equal :diamond, card.suit
    assert_equal 'Queen', card.value
    assert_equal 12, card.rank
  end
end
