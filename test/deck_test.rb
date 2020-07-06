require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"
require "./lib/card"

class DeckTest < Minitest::Test

  def test_it_exists
    deck = Deck.new([])
    assert_instance_of Deck, deck
  end

  def test_it_contains_cards
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:spade, "10", 10)
    deck = Deck.new([card1, card2])

    assert_equal [card1, card2], deck.cards
  end

  def test_it_can_find_card_details
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:spade, "10", 10)
    deck = Deck.new([card1, card2])

    assert_equal 10, deck.rank_of_card_at(1)
    assert_equal :heart, deck.cards[0].suit
    assert_equal "10", deck.cards[1].value
  end

  def test_face_cards
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    card4 = Card.new(:club, "5", 5)
    deck = Deck.new([card1, card2, card3, card4])

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_ranking_percent
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    card4 = Card.new(:club, "5", 5)
    deck = Deck.new([card1, card2, card3, card4])

    assert_equal "50%", deck.percent_high_ranking
  end

  def test_it_can_add_cards
    deck = Deck.new([])
    card1 = Card.new(:diamond, "Queen", 12)
    deck.add_card(card1)

    assert_equal [card1], deck.cards
  end

  def it_can_remove_cards
    deck = Deck.new([card1, card2])
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    deck.remove_card

    assert_equal [card2], deck.cards
  end
end
