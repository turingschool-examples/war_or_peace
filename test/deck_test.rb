require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
    @cards = [@card1, @card2, @card3, @card4]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    @deck
    assert_instance_of Deck, @deck
  end

  def test_rank_of_cards
    # deck = Deck.new(@cards)
    @deck
    assert_equal 12, @deck.rank_of_card_at(0)
    assert_equal 14, @deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards
    @deck
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_percent_high_ranking
    @deck
    assert_equal 50.0, @deck.percent_high_ranking
  end

  def test_remove_card
    @deck
    @deck.remove_card
    assert_equal [@card2, @card3, @card4], @deck.cards
  end

  def test_add_card
    @deck
    @deck.add_card(@card4)
    assert_equal @cards, @deck.cards
  end

end
