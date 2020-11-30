require 'Minitest/autorun'
require 'Minitest/pride'
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

    assert_equal @cards, @deck.cards 
  end

  def test_rank_of_card
    assert_equal 12, @deck.rank_of_card(0)
    assert_equal 14, @deck.rank_of_card(2)
  end
end