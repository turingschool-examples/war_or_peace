require 'minitest/autorun'
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

end
