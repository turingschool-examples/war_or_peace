require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"
require "./lib/card"

class DeckTest < Minitest::Test
  def test_it_exists_and_has_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
    assert_equal [card1, card2, card3], deck.cards
  end
end