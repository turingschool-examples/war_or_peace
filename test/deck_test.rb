require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"
require "./lib/card"

class DeckTest < Minitest::Test
  def test_it_exists_and_has_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
    assert_equal [card1, card2, card3], deck.cards
  end

  def test_it_can_tell_card_rank_at_index
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_it_can_tell_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_it_can_tell_the_percentage_of_high_rank_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_it_can_remove_a_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal card1, deck.remove_card
    assert_equal [card2, card3], deck.cards
  end

  def test_it_can_tell_percentage_rank_after_card_removed
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
    assert_equal [card3], deck.high_ranking_cards
    assert_equal 50.0, deck.percent_high_ranking
  end

  def test_it_can_add_cards
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    assert_equal [card2, card3, card4], deck.cards
  end

  def test_it_can_tell_percentage_rank_after_card_added
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card2, card3]
    deck = Deck.new(cards)
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)
    assert_equal [card3], deck.high_ranking_cards
    assert_equal 33.33, deck.percent_high_ranking
  end
end