require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @cards2 = [@card2, @card3]
    @deck = Deck.new(@cards)
    @deck2 = Deck.new(@cards2)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
    assert_instance_of Deck, @deck2
  end

  def test_it_has_readable_attributes
    assert_equal [@card1, @card2, @card3], @deck.cards
    assert_equal [@card2, @card3], @deck2.cards
  end

  def test_rank_of_card_at
    assert_equal @card1.rank, @deck.rank_of_card_at(0)
    assert_equal @card3.rank, @deck2.rank_of_card_at(1)
  end

  def test_high_ranking_cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
    assert_equal [@card3], @deck2.high_ranking_cards
  end

  def test_percent_high_ranking
    assert_equal 66.67, @deck.percent_high_ranking
    assert_equal 50.00, @deck2.percent_high_ranking
  end

  def test_remove_card
    @deck.remove_card
    @deck2.remove_card

    assert_equal [@card2, @card3], @deck.cards
    assert_equal [@card3], @deck2.cards
  end

  def test_add_card
    card4 = Card.new(:club, '5', 5)
    @deck.add_card(card4)
    @deck2.add_card(card4)

    assert_equal [@card1, @card2, @card3, card4], @deck.cards
    assert_equal [@card2, @card3, card4], @deck2.cards
  end
end
