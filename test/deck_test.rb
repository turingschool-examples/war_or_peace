require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 3, cards.length
  end

  def test_it_can_return_rank_at_index_pos
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    # require "pry"; binding.pry
    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_it_can_return_rank_at_another_index_pos
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    # require "pry"; binding.pry
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_it_returns_high_ranking_cards
    skip
    assert_equal [card1, card2], deck.high_ranking_cards
  end

  def test_it_returns_percentage_of_high_ranking_cards
    skip
    assert_equal 50.0, deck.percent_high_ranking
  end

  def test_it_can_remove_top_card
    skip
    assert_equal 2, cards.length
  end

  def test_it_can_add_one_card_to_bottom
    skip
    assert_equal 3, cards.length
  end

end
