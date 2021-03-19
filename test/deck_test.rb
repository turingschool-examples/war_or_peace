require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
    @deck = Deck.new(@cards)
    @deck.add_card(@card1)
    @deck.add_card(@card2)
    @deck.add_card(@card3)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_no_cards
    deck = Deck.new(@cards)
    
    assert_equal [], deck.cards
  end

  def test_it_can_hold_cards
    # @deck.add_card(@card1)
    # @deck.add_card(@card2)
    # @deck.add_card(@card3)

    assert_equal [@card1, @card2, @card3], @deck.cards
  end

  def test_it_can_call_card_rank
    # @deck.add_card(@card1)
    # @deck.add_card(@card2)
    # @deck.add_card(@card3)

    assert_equal 12, @deck.rank_of_card_at(0)
    assert_equal 14, @deck.rank_of_card_at(2)
  end

  def test_it_can_find_high_ranking_cards
    # @deck.add_card(@card1)
    # @deck.add_card(@card2)
    # @deck.add_card(@card3)

    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_it_can_give_percentage_of_high_ranking_cards
    # @deck.add_card(@card1)
    # @deck.add_card(@card2)
    # @deck.add_card(@card3)

    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_can_remove_a_card_from_the_front_and_add_a_card_to_the_back
    # @deck.add_card(@card1)
    # @deck.add_card(@card2)
    # @deck.add_card(@card3)

    assert_equal @card1, @deck.remove_card
    assert_equal [@card2, @card3], @deck.cards
    assert_equal [@card3], @deck.high_ranking_cards
    assert_equal 50.0, @deck.percent_high_ranking

  @deck.add_card(@card4)

  assert_equal [@card2, @card3, @card4], @deck.cards
  assert_equal [@card3], @deck.high_ranking_cards
  assert_equal 33.33, @deck.percent_high_ranking
  end
end
