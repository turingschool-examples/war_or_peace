require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'
​
class DeckTest < Minitest::Test
  #def setup   ... can use def_setup so you do not have to keep pasting the variables
  # @card1 = Card.new(:diamond, 'Queen', 12)
  # @card2 = Card.new(:spade, '3', 3)
  # @card3 = Card.new(:heart, 'Ace', 14)
  # @cards = [@card1, @card2, @card3]
  # @deck = Deck.new(@cards)
  # #end
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
    #assert_instance_of Deck, @deck
    assert_equal cards, deck.cards
    #assert_equal @cards, @deck.cards
  end

  def test_rank_of_card_at
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 14, deck.rank_of_card_at(2)
    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_percent_high_ranking
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_remove_card
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal card1, deck.remove_card
  end

  def test_add_card
    # skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    card4 = Card.new(:club, '5', 5)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3, card4], deck.add_card(card4)
  end
end
