require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    @cards = [card1, card2, card3]
  end

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_rank_of_cards
    deck = Deck.new(@cards)
    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards
    skip
    deck = Deck.new(@cards)
    assert_greater_than 10, deck.high_ranking_cards
  end

  def test_percent_high_ranking
    deck = Deck.new(@cards)
    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_remove_card
    skip
    deck = Deck.new(@cards)
    deck.remove_card
    # binding.pry
    assert_equal 2, deck.cards
  end

  def test_add_card
    skip
  end

end
