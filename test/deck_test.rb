require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  # Create an array of card instances
  def setup
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
  end

  def test_it_exists
    cards = setup
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    cards = setup
    deck = Deck.new(cards)
    assert_equal cards, deck.cards
  end

end
