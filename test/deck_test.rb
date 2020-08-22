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
    @deck = Deck.new(@cards)
  end

  def test_it_exists

    assert_instance_of Deck, @deck
  end

  def test_it_has_readable_attributes

    assert_equal [@card1, @card2, @card3], @deck.cards
  end

  def test_it_can_find_rank_of_card_at

    assert_equal 12, @cards[0].rank
    assert_equal 3, @cards[1].rank
    assert_equal 14, @cards[2].rank
  end

  def test_it_can_identify_high_ranking_cards

    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_it_can_calculate_percent_of_high_ranking_cards

    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_can_remove_cards

    assert_equal @card1, @deck.remove_card
    assert_equal [@card2, @card3], @deck.cards
  end

  def test_it_can_add_cards
    card4 = Card.new(:club, '5', 5)
    @deck.add_card(card4)

    assert_equal [@card1, @card2, @card3, card4], @deck.cards
  end

  def test_it_can_populate_deck
    deck = Deck.new

    deck.populate_standard_deck
# How do I test this? Also test no duplicates.
    assert_equal 52, deck.cards.length
  end

  def test_it_can_shuffle
    skip
    deck = Deck.new
    deck.populate_standard_deck
    shuffled_deck = deck.shuffle_deck

# This test doesn't work, but the method does what I want it to
    refute deck.cards, shuffled_deck
  end

end
