require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def test_card_file_is_accessible
    card1 = Card.new(:diamond, 'queen', 12)

    assert_instance_of Card, card1
  end

  def test_deck_file
    deck = Deck.new(card)

    assert_instance_of Deck, deck
  end

end
