require './lib/deck'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'


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

  def test_has_attributes

    assert_equal @cards, @deck.cards
  end

  def test_high_ranking_cards
    high_ranking_cards = [@card1, @card3]

    assert_equal high_ranking_cards, @deck.high_ranking_cards
  end


end
