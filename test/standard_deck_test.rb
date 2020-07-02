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
    standard_deck = StandardDeck.new({
        2 => "2",
        3 => "3",
        4 => "4",
        5 => "5",
        6 => "6",
        7 => "7",
        8 => "8",
        9 => "9",
       10 => "10",
       11 => "Jack",
       12 => "Queen",
       13 => "King",
       14 => "Ace"
    }, [:heart, :spade, :diamond, :club])
    assert_instance_of StandardDeck, standard_deck
  end

  def test_it_has_attributes
    skip
    standard_deck = StandardDeck.new({
        2 => "2",
        3 => "3",
        4 => "4",
        5 => "5",
        6 => "6",
        7 => "7",
        8 => "8",
        9 => "9",
       10 => "10",
       11 => "Jack",
       12 => "Queen",
       13 => "King",
       14 => "Ace"
    }, [hearts, spades, diamonds, clubs])

        expected = {
            2 => "2",
            3 => "3",
            4 => "4",
            5 => "5",
            6 => "6",
            7 => "7",
            8 => "8",
            9 => "9",
           10 => "10",
           11 => "Jack",
           12 => "Queen",
           13 => "King",
           14 => "Ace"
        }
        assert_equal expected, standard_deck.ranks_and_values

        expected_2 = [:heart, :club, :diamond, :spade]

        assert_equal expected_2, standard_deck.suits
    #it should initialize with all 52 cards, and I still smell a hash!

  end

  def test_it_has_52_cards
    skip
    assert

  end



  # it should have a shuffle method

  # it should have a method where the total deck is divided evenly into number of players

  #I'm smelling a hash....I think the keys should be turn = {player => }



end
