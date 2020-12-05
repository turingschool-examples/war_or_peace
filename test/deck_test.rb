require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'


class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '5', 5)
    card3 = Card.new(:club, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '5', 5)
    card3 = Card.new(:club, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
  assert_equal cards, deck.cards
  end

  def test_it_has_rank_location
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '5', 5)
    card3 = Card.new(:club, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal cards, deck.cards

  end

  def test_it_has_high_rank_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '5', 5)
    card3 = Card.new(:club, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert(deck.high_ranking_cards, card1)

  end

  def test_percentage_of_high_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '5', 5)
    card3 = Card.new(:club, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 33.33, deck.percent_high_ranking
  end

  def test_it_can_remove_cards
    skip
  end

  def test_it_can_add_cards
    skip
  end

end
