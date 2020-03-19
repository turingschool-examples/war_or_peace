require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Jack', 11)
    @card3 = Card.new(:club, '4', 4)
    @card4 = Card.new(:heart, 'King', 13)
    @cards =[@card1, @card2, @card3]
    @deck = Deck.new(@cards)

  end

  # Change these to assert the array is correct vs checking length of the array
  def test_rank_of_card_at_
    @deck = Deck.new(@cards)
    assert_equal 12, @deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards
    assert_equal [@card1, @card2], @deck.high_ranking_cards
  end

  def test_is_high_ranking?
    assert_equal true, @deck.is_high_ranking?(@deck.cards[1])
    assert_equal false, @deck.is_high_ranking?(@deck.cards[2])
  end

  def test_percent_high_ranking
    assert_equal (2.0/3.0 * 100).round(2), @deck.percent_high_ranking
  end

  def test_remove_card
    @deck.remove_card
    assert_equal [@card2, @card3], @deck.cards
  end

  def test_add_card
    @deck.add_card(@card4)
    assert_equal @cards << @card4, @deck.cards
  end

end
