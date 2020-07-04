require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/deck'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, "jack", 11)
    @card2 = Card.new(:heart, "10", 10)
    @card3 = Card.new(:heart, "9", 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @deck3 = Deck.new([@card5, @card2, @card4, @card1])
    @deck4 = Deck.new([@card5, @card1, @card8, @card4])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @player3 = Player.new("Brett", @deck3)
    @player4 = Player.new("Nick", @deck4)

  end

  def test_it_exists


    turn = Turn.new(@player1, @player2)

    assert_instance_of Turn, turn
  end

  def test_it_has_players
    turn = Turn.new(@player1, @player2)

    assert_instance_of Player, turn.player1
    assert_instance_of Player, turn.player2
  end

  def test_it_has_spoils_of_war
    turn = Turn.new(@player1, @player2)

    assert_equal [], turn.spoils_of_war
  end

  def test_it_has_a_type_basic
    turn = Turn.new(@player1, @player2)
    assert_equal :basic, turn.type
  end

  def test_it_has_a_type_war
    turn = Turn.new(@player3, @player4)
    assert_equal :war, turn.type
  end


  def test_it_has_a_type_mutually_assured_destruction
    turn = Turn.new(@player1, @player4)
    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_if_cards_in_spoils_of_war
    turn = Turn.new(@player3, @player4)
    turn1 = Turn.new(@player1, @player2)
    war_spoils_of_war = [@card5, @card2, @card4, @card5, @card1, @card8]
    basic_spoils_of_war = [@card1,@card3]

    turn.pile_of_cards(turn.type)
    turn1.pile_of_cards(turn1.type)

    assert_equal war_spoils_of_war, turn.spoils_of_war
    assert_equal basic_spoils_of_war, turn1.spoils_of_war
  end









end
