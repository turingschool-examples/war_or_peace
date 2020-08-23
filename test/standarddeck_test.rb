require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/standarddeck'

class StandardDeckTest < Minitest::Test
  def test_it_exists_and_has_attributes
    standard_deck = StandardDeck.new


    assert_instance_of StandardDeck, standard_deck
  end

  def test_standard_deck
    standard_deck = StandardDeck.new
    skip
    assert_equal 52, standard_deck.size
  end

  def test_randomize
    standard_deck = StandardDeck.new

    assert_equal 26, standard_deck.randomize[0].length
    #assert_equal shuffle_deck, standard_deck.randomize
      # why assert_not_equal not working?

    #assert_equal player1, standard_deck.randomize
  end


end
