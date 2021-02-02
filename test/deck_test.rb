require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test
  def test_it_exists
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_attributes
    skip
    deck = Deck.new(cards)

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    # require "pry"; binding.pry

    # deck.add_card(card1)
    # deck.add_card(card2)
    # deck.add_card(card3)
    #
    #
    # assert_equal 3, deck.rank_of_card_at(1)
    #
    # assert_equal 2, deck.high_ranking_cards
    #
    # assert_equal 66, deck.percent_high_ranking

  end
end
