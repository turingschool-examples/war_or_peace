require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, '3', 3)
    @card2 = Card.new(:heart, 'Queen', 12)
    @card3 = Card.new(:spade, 'King', 13)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_a_cards_attribute
    assert_equal @cards, @deck.cards
  end

  def test_it_returns_rank_of_card_at_given_index
    assert_equal @card1.rank, @deck.rank_of_card_at(0)
  end

  def test_it_returns_high_ranking_cards
    assert_equal [@card2, @card3], @deck.high_ranking_cards
  end
end
