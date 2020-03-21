require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

#cards and deck as instance varaibles to get rid of long set up

class DeckTest < Minitest::Test
  def setup
    cards = [
      Card.new(:diamond, "Queen", 12),
      Card.new(:spades, "Ace", 13),
      Card.new(:hearts, "Nine", 9)
    ]
    deck = Deck.new(cards)
  end

  def test_it_exists
    cards = [
      Card.new(:diamond, "Queen", 12),
      Card.new(:spades, "Ace", 13),
      Card.new(:hearts, "Nine", 9)
    ]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_rank_of_card_at
    cards = [
      Card.new(:diamond, "Queen", 12),
      Card.new(:spades, "Ace", 13),
      Card.new(:hearts, "Nine", 9)
    ]

    deck = Deck.new(cards)

#test it has cards --create new method above test_it_rank_of_card_at
    assert_equal cards, deck.cards
    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_high_ranking_cards
    cards = [
      Card.new(:diamond, "Queen", 12),
      Card.new(:spades, "Ace", 13),
      Card.new(:hearts, "Nine", 9)
    ]

    deck = Deck.new(cards)

    assert_equal cards, deck.cards
    assert_equal cards[0..1], deck.high_ranking_cards
  end

  def test_percent_high_ranking
    cards = [
      Card.new(:diamond, "Queen", 12),
      Card.new(:spades, "Ace", 13),
      Card.new(:hearts, "Nine", 9)
    ]

    deck = Deck.new(cards)
    assert_equal 66.67, deck.percent_high_ranking

  end

  def test_remove_card
    cards = [
      Card.new(:diamond, "Queen", 12),
      Card.new(:spades, "Ace", 13),
      Card.new(:hearts, "Nine", 9)
    ]

    deck = Deck.new(cards)
    assert_equal cards.shift, deck.remove_card
    #cards index zero to make sure first card is the one removed
  end

  def test_add_card
    cards = [
      Card.new(:diamond, "Queen", 12),
      Card.new(:spades, "Ace", 13),
      Card.new(:hearts, "Nine", 9)
    ]
    card = Card.new( :diamond, "Jack", 11)
    deck = Deck.new(cards)
    deck.add_card(card)
    assert_equal 4, deck.cards.count

  end
end
