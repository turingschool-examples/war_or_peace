require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

def setup
  @card1 = Card.new('heart', '5', 5)
  @card2 = Card.new('spade', 'jack', 11)
  @card3 = Card.new('diamond', 'ace', 14)
  @cards = [@card1, @card2, @card3]
  @deck = Deck.new(@cards)
end



  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_cards_have_readable_attributes
    assert_equal 'heart', @deck.cards[0].suit
    assert_equal 'jack', @deck.cards[1].value
    assert_equal 14, @deck.cards[2].rank
  end

  def test_rank_card_at_method
    assert_equal 5, @deck.rank_of_card_at(0)
    assert_equal 14, @deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards_method
    assert_operator 10, :<, @deck.high_ranking_cards[0].rank
    assert_operator 10, :<, @deck.high_ranking_cards[1].rank
  end

  def test_percent_high_ranking
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_remove_card_method
    @deck.remove_card

    assert_equal 2, @cards.length
    assert_equal 'spade', @deck.cards[0].suit
  end

  def test_add_card_method
    @deck.add_card('club', '7', 7)

    assert_equal 4, @cards.length
    assert_equal 'club', @deck.cards[3].suit
  end

end
