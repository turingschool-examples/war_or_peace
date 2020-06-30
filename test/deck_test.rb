require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/deck'
require_relative '../lib/card'
require "pry"

class DeckTest < Minitest::Test
  def setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spades, '3', 3)
    card3 = Card.new(:heart, 'Ace', 11)
  end

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spades, '3', 3)
    card3 = Card.new(:heart, 'Ace', 11)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spades, '3', 3)
    card3 = Card.new(:heart, 'Ace', 11)
    cards = [card1, card2, card3]
    card4 = Card.new(:diamond, '8', 8)
    cards.push(card4)
    deck = Deck.new(cards)

    assert_equal 4, deck.cards.length
    # assert_equal 'Queen', card.value
    # assert_equal 12, card.rank
  end
end
