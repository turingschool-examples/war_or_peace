require 'minitest/autorun'
require '../lib/card'
require '../lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_has_readable_attributes
    assert_equal [@card1, @card2, @card3], @deck.cards
  end

  def test_it_can_rank_card
    assert_equal 12, @deck.rank_of_card_at(0)
  end

  def test_it_can_find_high_ranking_cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_it_can_find_percent_high_ranking
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_can_add_card
    new_card = Card.new(:heart, "4", 4)
    @deck.add_card(new_card)
    new_card_count = @deck.cards.length
    assert_equal 4, new_card_count
  end

  def test_it_can_remove_card
    @deck.remove_card
    new_card_count = @deck.cards.length
    assert_equal 2, new_card_count
  end

end
