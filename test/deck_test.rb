require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    deck = Deck.new(Card)
  end

  def test_it_exists
    setup

    assert_instance_of Deck, deck
  end

end
