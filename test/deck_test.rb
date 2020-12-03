require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

require 'pry'

# KEEP THIS FOR ITERATION 3
# ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
# suits = %w{Spades Hearts Diamonds Clubs}
# suits.each do |suit|
  # ranks.size.times do |i|
    # stack_of_cards << Card.new( ranks[i], suit, i+1 )
  # end
# end

# Devise a scheme to represent each card with a number,
# write methods to determine its face and type.
# Then just populate a array using a loop number from 1 to 52


class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'King', 13)
    @card2 = Card.new(:club, '2', 2)
    @card3 = Card.new(:spade, '10', 10)
    @card4 = Card.new(:diamond, '8', 8)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal @cards, @deck.cards
  end

  def test_it_returns_rank
    assert_equal 13, @deck.rank_of_card_at(0)
  end

  def test_it_returns_other_ranks
    assert_equal 10, @deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards_will_only_be_returned
    assert [@card1], @deck.high_ranking_cards
    refute_equal [@card2, @card3], @deck.high_ranking_cards
  end

  def test_it_returns_high_rank_percentage
    assert_equal 33.3, @deck.percent_high_ranking
  end

  def test_it_removes_top_card
    assert_equal [@card2, @card3], @deck.remove_card
  end

  def test_it_adds_card_to_end_of_deck
    assert_equal [@card1, @card2, @card3, @card4], @deck.add_card(@card4)
  end

end
