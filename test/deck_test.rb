require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require "pry"

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new(:heart, "Jack", 11)
    @card_2 = Card.new(:diamond, "6", 6)
    @card_3 = Card.new(:heart, "Queen", 12)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal @cards, @deck.cards
  end

  def test_it_has_rank_of_cards_at
    assert_equal 11, @deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards
    assert_equal [@card_1, @card_3], @deck.high_ranking_cards
  end

  def test_percent_of_high_ranking
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_if_card_can_be_removed
    assert_equal @card_1, @deck.remove_card
    assert_equal 2, @deck.cards.length
  end

  def card_can_be_added
    assert_equal @card_1, @deck.push
  end
end
