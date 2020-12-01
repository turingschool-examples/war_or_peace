require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
  end

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Card, card1
    assert_instance_of Card, card2
    assert_instance_of Card, card3
    assert_instance_of Deck, deck
  end

  def test_cards_are_an_array_of_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3], deck.cards
  end

  def test_card_has_rank
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [12, 3, 14], deck.rankings
    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
    assert_equal cards, deck.cards
  end

  def test_it_has_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 3, deck.high_ranking_total
    assert_equal [card1, card3], deck.high_ranking_cards
    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_it_can_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    deck.remove_card

    assert_equal [card2, card3], deck.cards
    assert_equal [card3], deck.high_ranking_cards
    assert_equal 50.0, deck.percent_high_ranking
  end

  def test_it_can_add_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    assert_equal [card2, card3, card4], deck.cards
    assert_equal [card3], deck.high_ranking_cards
    assert_equal 33.33, deck.percent_high_ranking
  end
end
