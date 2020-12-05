require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'


class DeckTest < Minitest::Test
  def setup

  end

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '5', 5)
    card3 = Card.new(:club, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end
  def test_it_has_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '5', 5)
    card3 = Card.new(:club, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
  assert_equal cards, deck.cards
  end
end
