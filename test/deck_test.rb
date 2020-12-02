require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new(:diamond, 'Queen', 12)
    @card_2 = Card.new(:heart, 'Jack', 11)
    @card_3 = Card.new(:club, 'Two', 2)
    @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_readable_attributes
    assert_equal @cards, @deck.cards
  end

  def test_rank_of_card_at
    # TODO (alex schwartz): which one of these is the better Expected param for this test?
    # assert_equal 12, @deck.rank_of_card_at(1)
    assert_equal @deck.cards.first.rank, @deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards
    assert_equal 2, @deck.high_ranking_cards.length
    assert_includes @deck.high_ranking_cards, @card_1
    assert_includes @deck.high_ranking_cards, @card_2
  end

  def test_percent_high_ranking
    assert_equal 0.67, @deck.percent_high_ranking
  end
end
