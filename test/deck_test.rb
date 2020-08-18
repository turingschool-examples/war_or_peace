require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'
require '../lib/card'

class DeckTest < Minitest::Test

def setup
  deck = Deck.new([cards])
end

def test_it_exists
  deck = Deck.new()

  assert_instance_of Deck, deck
end

end
