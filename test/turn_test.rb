require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Queen', 12)
    @card2 = Card.new(:diamond, '3', 3)
    @card3 = Card.new(:spade, 'King', 13)
    @card4 = Card.new(:heart, '8', 8)
    @card5 = Card.new(:club, 'Jack', 11)
    @card6 = Card.new(:diamond, '5', 5)
    @card7 = Card.new(:heart, 'King', 13)
    @card8 = Card.new(:club, '3', 3)
    @basic_deck1 = Deck.new([@card1, @card2, @card3])
    @basic_deck2 = Deck.new([@card4, @card5, @card6])
    @player1 = Player.new('Ryan', @basic_deck1)
    @player2 = Player.new('Tim', @basic_deck2)
    @basic_turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @basic_turn
  end

  def test_it_has_a_player_1_attribute
    assert_equal @player1, @basic_turn.player1
  end

  def test_it_has_a_player_2_attribute
    assert_equal @player2, @basic_turn.player2
  end

  def test_it_has_a_spoils_of_war_attribute_that_defaults_to_an_empty_array
    assert_equal [], @basic_turn.spoils_of_war
  end
end
