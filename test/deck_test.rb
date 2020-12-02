require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_there_is_a_deck
    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_deck_has_cards
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    assert_equal 3, deck.cards.length
  end
end
