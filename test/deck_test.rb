require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card = Card.new(:spade, 'Ten', 10)
    cards = []
    cards << card
    deck = Deck.new(cards)

    assert_instance_of(Deck, deck)
  end
end
