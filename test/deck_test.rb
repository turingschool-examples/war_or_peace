require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'
require '../lib/card'
require 'pry'

#Test passes but getting unititialized constant error for Deck...
class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @cards = [@card1, @card2, @card3]

    @deck1 = Deck.new(@cards)
    #binding.pry

  end

  def test_it_exists
    assert_instance_of Deck, @deck1
  end


  def test_percent_high_ranking_cards
    assert_equal 67, @deck1.percent_high_ranking
  end

  def test_has_high_ranking_cards
    assert_equal [@card1, @card3], @deck1.high_ranking_cards
  end

  def test_rank_of_a_card_at_a_given_index
    assert_equal 3, @deck1.rank_of_card_at(1)
  end

  def test_add_a_card_to_bottom_of_deck
   card4 = Card.new(:heart, '5', 5)


   assert_equal [@card1, @card2, @card3, card4], @deck1.add_card(card4)
  end

  def test_remove_top_card_from_deck
    assert_equal [@card2, @card3], @deck1.remove_card
  end

end
