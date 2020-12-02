require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
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

  def test_it_returns_nil_for_rank_if_card_not_found
    deck = Deck.new([])

    assert_nil deck.rank_of_card_at(0)
  end

  def test_it_returns_rank_if_card_found
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:heart, '3', 3)
    card3 = Card.new(:spade, '10', 10)

    deck = Deck.new([card1, card2, card3])

    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_it_returns_cards_with_a_rank_above_10
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:diamond, 'King', 13)
    card3 = Card.new(:spade, '7', 7)

    deck = Deck.new([card1, card2, card3])

    assert_equal [card1, card2], deck.high_ranking_cards
  end

end
