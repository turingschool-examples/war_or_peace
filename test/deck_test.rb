require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require 'pry'

class CardTest < Minitest::Test

  def setup
    # figure out how to properly setup
    # card & deck instances in order to
    # easily run multiple tests without
    # redeclaring variables
  end

  def test_it_exists
    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_deck_w_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal cards, deck.cards

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)

    assert_equal [card1, card3], deck.high_ranking_cards

    assert_equal 66.67, deck.percent_high_ranking

    assert_equal card1, deck.remove_card
    assert_equal [card2, card3], deck.cards

    assert_equal 50.0, deck.percent_high_ranking

    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    assert_equal [card2, card3, card4], deck.cards

    assert_equal [card3], deck.high_ranking_cards

    assert_equal 33.33, deck.percent_high_ranking

  end

end
