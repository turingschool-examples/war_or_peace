require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @cards = []
    @card_1 = Card.new(:diamond, 'Queen', 12)
    @card_2 = Card.new(:spade, '3', 3)
    @card_3 = Card.new(:heart, 'Ace', 14)

    @cards.push(@card_1)
    @cards.push(@card_2)
    @cards.push(@card_3)
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_high_ranking_cards
    assert_equal [@card_1, @card_3], @deck.high_ranking_cards
  end

  def test_percent_high_ranking
    assert_equal 2.0/3, @deck.percent_high_ranking
  end

  def test_add
    card_4 = Card.new(:club, '5', 5)
    @deck.add(card_4)

    assert_equal [@card_1, @card_2, @card_3, card_4], @deck.cards
  end

  def test_remove
    @deck.remove

    assert_equal  [@card_2, @card_3], @deck.cards
  end
end
