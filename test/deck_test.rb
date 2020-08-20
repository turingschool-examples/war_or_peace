require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists_and_has_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck =Deck.new(cards)

    assert_instance_of Deck, deck
    assert_equal cards, deck.cards
  end

  def test_rank_of_card_at
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 3, deck.rank_of_card_at(1)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_high_ranking_cards
    card1 = Card.new(:hearts, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:spade, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end


end
