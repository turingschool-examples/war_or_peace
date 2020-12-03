require 'minitest/autorun'
require 'minitest/pride'
require './lib/standard_deck'
require './lib/deck'

class StandardDeckTest < Minitest::Test
  def setup
    @standard_deck = StandardDeck.new
  end

  def test_it_exists
    assert_instance_of StandardDeck, @standard_deck
  end

  def test_add_card
    @standard_deck.create_standard_deck
    assert_equal 52, @standard_deck.cards.count
  end
end
