require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"

class StandardDeckTest < Minitest::Test

  def setup
    @all_cards_info = {
      "ranks" => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
      "values" => ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"],
      "suits" => [:heart, :diamond, :spade, :club]
      }

    @standard_deck = StandardDeck.new(@all_cards_info)
  end

  def test_it_exists

    assert_instance_of StandardDeck, @standard_deck
  end

  def test_it_has_attributes
    assert_equal [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], @standard_deck.ranks
    assert_equal ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"], @standard_deck.values
    assert_equal [:heart, :diamond, :spade, :club], @standard_deck.suits





  end

  def test_it_has_52_cards
    skip
    assert

  end



  # it should have a shuffle method

  # it should have a method where the total deck is divided evenly into number of players

  #I'm smelling a hash....I think the keys should be turn = {player => }
#
# Messing Around:
# [1] pry(#<StandardDeck>)> x
# => [[2, "2"],
#  [3, "3"],
#  [4, "4"],
#  [5, "5"],
#  [6, "6"],
#  [7, "7"],
#  [8, "8"],
#  [9, "9"],
#  [10, "10"],
#  [11, "Jack"],
#  [12, "Queen"],
#  [13, "King"],
#  [14, "Ace"]]
# [2] pry(#<StandardDeck>)> @values
# => nil
# [3] pry(#<StandardDeck>)> @value
# => [:heart, :spade, :diamond, :club]
# [4] pry(#<StandardDeck>)> d = {}
# => {}
# [5] pry(#<StandardDeck>)> @value.each do |value|
# [5] pry(#<StandardDeck>)*   d[value] = {}
# [5] pry(#<StandardDeck>)* end
# => [:heart, :spade, :diamond, :club]
# [6] pry(#<StandardDeck>)> d
# => {:heart=>{}, :spade=>{}, :diamond=>{}, :club=>{}}
# [7] pry(#<StandardDeck>)> z = x.flat_map each do |x|
# [7] pry(#<StandardDeck>)*   d.each do |d|
# [7] pry(#<StandardDeck>)*     d[d] = x
# [7] pry(#<StandardDeck>)*   end
# [7] pry(#<StandardDeck>)* end
# NameError: undefined local variable or method `each' for #<StandardDeck:0x00007fa7ada5a3c8>
# from (pry):9:in `initialize'
# [8] pry(#<StandardDeck>)>

end
