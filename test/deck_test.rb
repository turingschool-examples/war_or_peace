require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Queen', 12)
    @card2 = Card.new(:diamond, '3', 3)
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

  def test_rank_of_card_at_method
    assert_equal @card1.rank, @deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards_method
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_percent_high_ranking_method
    num_high_ranking = @deck.high_ranking_cards.length
    expected = num_high_ranking.to_f / @cards.length * 100
    assert_equal expected, @deck.percent_high_ranking
  end

  def test_remove_card_method
    removed_card = @deck.remove_card

    assert_equal @card1, removed_card
    assert_equal [@card2, @card3], @deck.cards
    assert_equal [@card3], @deck.high_ranking_cards
    assert_equal 50.0, @deck.percent_high_ranking

    second_removed_card = @deck.remove_card

    assert_equal @card2, second_removed_card
    assert_equal [@card3], @deck.cards
    assert_equal [@card3], @deck.high_ranking_cards
    assert_equal 100.0, @deck.percent_high_ranking
  end
end
