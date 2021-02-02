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
  end

  def test_it_returns_high_ranking_cards
  end

  def test_it_returns_percentage_of_high_ranking_cards
  end

  def test_it_can_remove_top_card
  end

  def test_it_can_add_one_card_to_bottom
  end

end
