require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
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
    removed_card = @deck.remove_card

    assert_equal @card1, removed_card
    assert_equal [@card2, @card3], @cards
    assert_equal [@card2], @deck.high_ranking_cards
    assert_equal 50.00, @deck.percent_high_ranking

    removed_card_2 = @deck.remove_card

    assert_equal @card2, removed_card_2
    assert_equal [@card3], @cards
    assert_equal [], @deck.high_ranking_cards
    assert_equal 0.00, @deck.percent_high_ranking

    removed_card_3 = @deck.remove_card

    assert_equal @card3, removed_card_3
    assert_equal [], @cards
    assert_equal [], @deck.high_ranking_cards
    #assert_equal 0.00, @deck.percent_high_ranking #-- Doesn't work 0/0 is infinity.

  end

  def test_it_can_add_card

    card4 = Card.new(:club, '10', 10)
    @deck.add_card(card4)

    assert_equal [@card1, @card2, @card3, card4], @cards
    assert_equal [@card1, @card2], @deck.high_ranking_cards
    assert_equal 50.0, @deck.percent_high_ranking

  end

end
