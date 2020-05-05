require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/deck'
require_relative '../lib/card'

class DeckTest < Minitest::Test

  def test_new_deck_has_no_cards
    assert_equal [], Deck.new.cards
  end

  def test_add_to_cards_array
    deck = Deck.new
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck << card1
    deck << card2
    deck << card3

    assert_equal [card1, card2, card3], deck.cards
  end

  def test_rank_of_card_at_an_index
    deck = Deck.new
    card1 = Card.new(:heart, '4', 4)
    card2 = Card.new(:club, '10', 10)
    card3 = Card.new(:spade, 'King', 13)

    deck << card1
    deck << card3
    deck << card2

    assert_equal 4, deck.rank_of_card_at(0)
    assert_equal 13, deck.rank_of_card_at(1)
    assert_equal 10, deck.rank_of_card_at(2)
  end

  def test_list_high_ranking_cards
    deck = Deck.new
    card1 = Card.new(:heart, 'Ace', 14)
    card2 = Card.new(:club, '10', 10)

    deck << card1
    deck << card2

    assert_equal [card1], deck.high_ranking_cards
  end

  def test_percent_that_are_high_ranking
    deck = Deck.new
    card1 = Card.new(:heart, 'Ace', 14)
    card2 = Card.new(:club, '10', 10)

    deck << card1
    deck << card2

    assert_equal 50.00, deck.percent_high_ranking
  end

  def test_removing_a_card
    deck = Deck.new
    card1 = Card.new(:spade, 'Queen', 12)
    card2 = Card.new(:heart, '2', 2)

    deck << card1
    deck << card2

    deck.remove_card
    assert_equal [card2], deck.cards
  end

  def test_adding_a_card
    deck = Deck.new
    card4 = Card.new(:club, '5', 5)

    deck.add_card(card4)

    assert_equal [card4], deck.cards
  end

end
