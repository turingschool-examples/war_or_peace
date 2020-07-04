require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card4 = Card.new(:spades, "3", 3)
    card5 = Card.new(:kings, "13", 13)
    card6 = Card.new(:diamond, "7", 7)
    array_of_cards = [card4, card5, card6]
    deck = Deck.new(array_of_cards)

    assert_instance_of Deck, deck
  end

  def test_rank_of_card_at
    card4 = Card.new(:spades, "3", 3)
    card5 = Card.new(:heart, "king", 13)
    card6 = Card.new(:diamond, "7", 7)
    array_of_cards = [card4, card5, card6]
    deck = Deck.new(array_of_cards)


    assert_equal 13,deck.rank_of_card_at(1)
  end

  def test_high_rank_card
    card4 = Card.new(:spades, "3", 3)
    card5 = Card.new(:heart, "king", 13)
    card6 = Card.new(:diamonds, "7", 7)
    array_of_cards = [card4, card5, card6]
    deck = Deck.new(array_of_cards)

    assert_equal [card5], deck.high_ranking_cards
  end

  def test_percent_high_rank
    card4 = Card.new(:spades, "3", 3)
    card5 = Card.new(:heart, "king", 13)
    card6 = Card.new(:diamonds, "7", 7)
    array_of_cards = [card4, card5, card6]
    deck = Deck.new(array_of_cards)

    assert_equal 33.33, deck.percent_high_ranking
  end
end
