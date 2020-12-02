require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    cards = []
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'two', 2)
    cards.push(card_1)
    cards.push(card_2)
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_high_ranking_cards
    cards = []
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'two', 2)
    cards.push(card_1)
    cards.push(card_2)
    deck = Deck.new(cards)
    assert_equal [card_1], deck.high_ranking_cards()
  end
end
