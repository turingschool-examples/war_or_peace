require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require '.lib/card'

class DeckTest < Minitest::Test
  def setup
    deck = Deck.new(x)
  end

  def test_it_exists
    deck = Deck.new(x)

    assert_instance_of Deck, deck
  end

  def test
  end

end
