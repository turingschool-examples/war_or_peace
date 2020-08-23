require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def test_it_exists
    deck = Deck.new()

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_card_attribute
    deck = Deck.new()

    assert_equal [], deck.cards
  end

  def test_rank_of_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards_returns_array_of_cards_with_rank_over_ten
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '6', 6)
    card6 = Card.new(:heart, 'Jack', 11)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)

    assert_equal [card1, card3], deck.high_ranking_cards
    assert_equal [card6], deck2.high_ranking_cards
  end

  def test_percent_high_ranking_gives_total_percentage_of_high_ranking_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '6', 6)
    card6 = Card.new(:heart, 'Jack', 11)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)

    assert_equal 66.67, deck.percent_high_ranking
    deck.remove_card
    assert_equal 50.00, deck.percent_high_ranking
    assert_equal 33.33, deck2.percent_high_ranking
  end

  def test_remove_card_removes_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3], deck.cards
    assert_equal card1, deck.remove_card
    assert_equal [card2, card3], deck.cards
    assert_equal card2, deck.remove_card
    assert_equal [card3], deck.cards
  end

  def test_add_card_adds_new_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    card5 = Card.new(:heart, '2', 2)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3], deck.cards
    assert_equal [card1, card2, card3, card4], deck.add_card(card4)
    assert_equal [card1, card2, card3, card4], deck.cards
    assert_equal [card1, card2, card3, card4, card5], deck.add_card(card5)
    assert_equal [card1, card2, card3, card4, card5], deck.cards
  end


# You might have 3 setups. One for basic turn, one for war turn, and one for MAD turn. I personally, just copy paste.

end
