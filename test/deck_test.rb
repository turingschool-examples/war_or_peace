require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal [card1, card2, card3], deck.cards
  end

  def test_it_returns_rank
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_it_return_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_it_returns_percent_high_ranking
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.cards
    deck.high_ranking_cards

    assert_equal 66.67, deck.percent_high_ranking

    deck.remove_card
    deck.cards
    deck.high_ranking_cards

    assert_equal 50.0, deck.percent_high_ranking
  end

  def test_it_removes_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.remove_card

    assert_equal [card2, card3], deck.cards
  end

  def test_it_adds_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    assert_equal [card2, card3, card4], deck.cards
  end

  def test_it_returns_new_percent
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    deck.cards
    deck.high_ranking_cards

    assert_equal 33.33, deck.percent_high_ranking
  end
end
