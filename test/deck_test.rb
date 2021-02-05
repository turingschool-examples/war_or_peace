require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

 class DeckTest < Minitest::Test
   def test_it_exists
     deck = Deck.new(:deck)

    assert_instance_of Deck, deck
  end

  def test_it_has_readable_attributes
    card = Card.new(:diamond, 'Queen', 12)

    assert_equal :diamond, card.suit
    assert_equal 'Queen', card.value
    assert_equal 12, card.rank

  end

  def test_rank_of_card_at
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal cards, deck.cards
    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 3, deck.rank_of_card_at(1)
    assert_equal 14, deck.rank_of_card_at(2)
    # assert_equal :diamond, card.suit
    # assert_equal 'Queen', card.value
    # assert_equal 12, card.rank
  end
 end
