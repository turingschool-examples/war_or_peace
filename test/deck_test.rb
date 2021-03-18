require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_no_cards
    assert_equal [], @deck.cards
  end

  def test_it_can_hold_cards
    @deck.add_cards(@card1)
    @deck.add_cards(@card2)
    @deck.add_cards(@card3)

    assert_equal [@card1, @card2, @card3], @deck.cards
  end
end
