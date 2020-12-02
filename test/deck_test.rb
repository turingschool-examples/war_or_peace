require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)
  end

  def test_the_deck_exists

    assert_instance_of Deck, @deck

  end

  def test_the_deck_has_readable_objects

    assert_equal @cards, @deck.cards

  end

  def test_rank_of_card_at

    assert_equal (12), @deck.rank_of_card_at(0)
    assert_equal (3), @deck.rank_of_card_at(1)
    assert_equal (14), @deck.rank_of_card_at(2)

  end

  def test_high_ranking_cards

    assert_equal [@card1, @card3], @deck.high_ranking_cards

  end

  def test_percent_high_ranking

    assert_equal (67), @deck.percent_high_ranking

  end

  def test_remove_card

    assert_equal @card1, @deck.remove_card

  end

  def test_add_card

    card4 = Card.new(:club, '5', 5)

    assert_equal [@card1, @card2, @card3, card4], @deck.add_card(card4)

  end
end
