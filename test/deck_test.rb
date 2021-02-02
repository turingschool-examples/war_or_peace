require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'



class DeckTest < Minitest::Test
  def test_it_exists
    deck = Deck.new(@cards)


    assert_instance_of Deck, deck
  end

  def card_setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    # @deck = Deck.new(@cards)
  end

  def test_can_find_rank_of_card_at
    assert_equal 12, @cards[0].rank
    assert_equal 3, @cards[1].rank
    assert_equal 14, @cards[2].rank
  end

end
