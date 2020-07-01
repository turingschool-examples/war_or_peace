require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def test_deck_exists

    cards = []
    card_one = Card.new(:heart, "Jack", 11)
    card_two = Card.new(:diamond, "Queen", 12)
    card_three = Card.new(:spade, "King", 13)

    cards << card_one
    cards << card_two
    cards << card_three
    deck = Deck.new(cards)
    assert_instance_of(Deck, deck)
  end

  def test_rank_of_card_at
    cards = []
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:diamond, "two", 2)
    card3 = Card.new(:spade, "three", 3)

    cards << card1
    cards << card2
    cards << card3
    deck = Deck.new(cards)

  end

  def test_cards_exist
    cards = []
    card1 = Card.new(:diamond, "four", 4)
    card2 = Card.new(:spade, "five", 5)

    cards << card1
    cards << card2

    assert_instance_of Array, cards
  end

end
