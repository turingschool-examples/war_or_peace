require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_there_is_a_deck
    deck = Deck.new
    assert_instance_of Deck, deck
  end

  def test_deck_has_cards_after_adding_them
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    assert_equal 3, deck.cards.length
  end

  def test_can_add_a_new_card
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    deck.add_card(card4)
    assert_equal 4, deck.cards.length
  end

  def test_can_remove_a_card
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    deck.remove_card
    assert_equal 2, deck.cards.length
  end

  def test_find_rank_of_card
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_a_different_rank
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_find_high_ranking_cards
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    assert_equal 2, deck.high_ranking_cards.length
  end

  def test_can_find_percent_of_high_ranking_cards
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    assert_equal 50.0, deck.percent_high_ranking
  end
end
