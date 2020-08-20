require 'minitest/autorun'
require 'minitest/pride'
require './lib/init'

class InitTest < Minitest::Test
  def setup
    @init = Init.new
  end
  
  def test_new_shuffled_deck


    deck = @init.new_shuffled_deck

    assert_equal 52, deck.cards.length
    assert deck.cards.is_a?(Array)
    deck.cards.each do |card|
      assert card.is_a?(Card)
      assert card.suit.is_a?(Symbol)
      assert card.value.is_a?(String)
      assert card.rank.is_a?(Integer)
      
    end
  end
end