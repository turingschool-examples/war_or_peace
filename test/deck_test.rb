require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    cards = []
    cards << Card.new(:diamond, 'Queen', 12)
    cards << Card.new(:spade, 'Jack', 11)
    cards << Card.new(:club, '4', 4)
    deck = Deck.new(cards)
  end

  def test_rank_of_card_at_
    cards = []
    cards << Card.new(:diamond, 'Queen', 12)
    cards << Card.new(:spade, 'Jack', 11)
    cards << Card.new(:club, '4', 4)
    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards
    cards = []
    cards << Card.new(:diamond, 'Queen', 12)
    cards << Card.new(:spade, 'Jack', 11)
    cards << Card.new(:club, '4', 4)
    deck = Deck.new(cards)

    assert_equal 2, deck.high_ranking_cards.length
  end

  def test_percent_high_ranking
    cards = []
    cards << Card.new(:diamond, 'Queen', 12)
    cards << Card.new(:spade, 'Jack', 11)
    cards << Card.new(:club, '4', 4)
    deck = Deck.new(cards)

    assert_equal 2.0/3.0, deck.percent_high_ranking
  end

  def test_remove_card
    cards = []
    cards << Card.new(:diamond, 'Queen', 12)
    cards << Card.new(:spade, 'Jack', 11)
    cards << Card.new(:club, '4', 4)
    deck = Deck.new(cards)

    deck.remove_card
    assert_equal 2, deck.cards.length
  end
end
