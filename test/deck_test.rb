require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class DeckTest < Minitest :: Test
  def setup
    deck = Deck.new()
  end

  def test_it_exists
    deck = Deck.new()

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_attributes
    card = Card.new()

    assert_equal
    assert_equal
    assert_equal
  end


end
