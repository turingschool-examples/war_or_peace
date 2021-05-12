require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_if_blank_array
    card = Deck.new(:diamond, 'Queen', 12)

    assert_instance_of Deck, []
  end
end
