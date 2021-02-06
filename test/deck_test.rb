require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_can_find_rank_of_card_at_index
    @cards
    @deck

    assert_equal 14, @deck.rank_of_card_at(2)
  end

  def test_can_select_high_ranking_cards
    @cards
    @deck

    high_rank_cards = [@card1, @card3]

    assert_equal high_rank_cards, @deck.high_ranking_cards
  end

  def test_can_calculate_percent_high_rank
    @cards
    @deck

    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_can_remove_card
    @cards
    @deck

    @deck.remove_card

    assert_equal @cards.shift, @deck.cards
  end

  def test_can_add_card
    @cards
    @deck

    @deck.remove_card


    assert_equal [@card2, @card3, @card4], @deck.add_card(@card4)
  end
end
