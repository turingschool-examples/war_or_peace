require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    cards = []
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'two', 2)
    cards.push(card_1)
    cards.push(card_2)
    @deck = Deck.new(cards)
  end

  def test_it_exists

    assert_instance_of Deck, @deck
  end

  def test_high_ranking_cards

    assert_equal 12, @deck.high_ranking_cards[0].rank
  end

  def test_percent_high_ranking

    assert_equal 0.5, @deck.percent_high_ranking
  end
end
