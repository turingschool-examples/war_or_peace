require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_deck_has_array_of_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_card_rank_at_given_index
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
    assert_equal cards, deck.cards
  end

  def test_identify_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
    assert_equal cards, deck.cards
  end

  def test_identify_percent_of_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking 
  end

  def test_remove_and_reveal_card
    skip
  end

  def test_high_ranking_cards_after_removal
    skip
  end

  def test_percent_high_ranking_cards_after_removal
    skip
  end

  def test_add_card_to_deck
    skip
  end

  def test_high_ranking_cards_after_addition
    skip
  end

  def test_percent_high_ranking_cards_after_addition
    skip
  end

end
