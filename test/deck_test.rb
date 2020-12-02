require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_deck_of_cards_exists
    deck = Deck.new([])

    assert_instance_of Deck, deck
  end

  def test_it_has_a_readable_attribute
    deck = Deck.new([])

    assert_equal [], deck.cards
  end
end
