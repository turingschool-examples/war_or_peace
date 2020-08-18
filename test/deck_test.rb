require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/deck'
require_relative '../lib/card'

class DeckTest < Minitest::Test
  def test_check_some_stuff
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    # require "pry"; binding.pry

    assert_equal [], deck.high_ranking_cards
  end

end
