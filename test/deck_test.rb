require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  # Create an array of card instances
  def setup
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
  end

  def test_it_exists
    cards = setup
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    cards = setup
    deck = Deck.new(cards)
    assert_equal cards, deck.cards
  end

  def test_it_can_query_rank_of_card
    cards = setup
    deck = Deck.new(cards)
    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_it_can_query_high_ranking_cards
    cards = setup
    deck = Deck.new(cards)
    highs = deck.high_ranking_cards
    all_high = highs.all? do |high|
      high.rank >= 11
    end
    assert all_high
  end

  def test_it_can_query_percent_high_ranking
    cards = setup
    deck = Deck.new(cards)
    # require "pry"; binding.pry
    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_it_can_remove_cards_from_the_top
    cards = setup
    deck = Deck.new(cards)
    top_deck = deck.remove_card
    assert_equal "Queen", top_deck.value
  end

end
