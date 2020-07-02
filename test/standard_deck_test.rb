require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"

class StandardDeckTest < Minitest::Test

  def test_it_exists
    standard_deck = StandardDeck.new
    assert_instance_of StandardDeck, standard_deck
  end

  def test_it_has_attributes
    standard_deck = StandardDeck.new
    assert_equal [], standard_deck.all_cards
    # It should hold an empty array where the new initiated cards will be held.

  end



  # it should have a shuffle method

  # it should have a method where the total deck is divided evenly into number of players

  #I'm smelling a hash....I think the keys should be turn = {player => }



end
