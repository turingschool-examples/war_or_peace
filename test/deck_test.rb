require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:heart, 'Jack', 11)
    cards = [card_1, card_2]

    @deck = Deck.new(cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end
end
