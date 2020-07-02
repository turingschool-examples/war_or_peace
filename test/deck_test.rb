require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class CardTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Ace', 14)
    @card3 = Card.new(:heart, '3', 3)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists

    assert_instance_of Deck, @deck
  end

  def test_it_has_readable_attributes

    assert_equal @cards, @deck.cards

  end

  def test_rank_of_card_at

    assert_equal 12, @deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards

    assert_equal [@card1, @card2], @deck.high_ranking_cards
  end

  def test_percent_high_ranking

    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_can_remove_card

    assert_equal [@card1, @card3], @deck.remove_card
  end

end
