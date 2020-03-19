require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)

    assert_instance_of Deck, card1
  end
end
