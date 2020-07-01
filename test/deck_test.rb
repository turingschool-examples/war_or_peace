require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require 'pry'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_can_return_card_rank
    assert_equal 12, @deck.rank_of_card_at(0)
  end

  def test_it_returns_high_rank_card
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_it_returns_percent_high_ranking
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_can_remove_card
    assert_equal @card1, @deck.remove_card
  end

  def test_it_can_add_card
    @card4 = Card.new(:club, '5', 5)
    @deck.add_card(@card4)
    assert_equal [@card1, @card2, @card3, @card4], @deck.cards
  end
end
