require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Ace', 14)
    @card3 = Card.new(:heart, '3', 3)
    @card4 = Card.new(:club, '9', 9)
    @card5 = Card.new(:diamond, '4', 4)
    @card6 = Card.new(:spade, '9', 9)
    @card7 = Card.new(:heart, 'Ace', 14)
    @card8 = Card.new(:club, 'King', 13)
    @cards = [@card1, @card4]
    @cards2 = [@card2, @card3]
    @cards3 = [@card2, @card4, @card5]
    @cards4 = [@card7, @card3, @card1]
    @cards5 = [@card4, @card3, @card7]
    @cards6 = [@card6, @card8, @card2]
    @deck = Deck.new(@cards)
    @deck2 = Deck.new(@cards2)
    @deck3 = Deck.new(@cards3)
    @deck4 = Deck.new(@cards4)
    @deck5 = Deck.new(@cards5)
    @deck6 = Deck.new(@cards6)
    @player1 = Player.new('Megan', @deck)
    @player2 = Player.new('Aurora',@deck2)
    @player3 = Player.new('Tyler', @deck3)
    @player4 = Player.new('Hailey',@deck4)
    @player5 = Player.new('Molly', @deck5)
    @player6 = Player.new('Michael',@deck6)
    @turn = Turn.new(@player1, @player2)
    @turn2 = Turn.new(@player3, @player4)
    @turn3 = Turn.new(@player5, @player6)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_readable_attributes
    # skip
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
    assert_equal @player5, @turn3.player1
  end

  def test_it_has_a_type
    assert_equal :basic, @turn.type
    assert_equal :war, @turn2.type
    assert_equal :mutually_assured_destruction, @turn3.type

  # require "pry"; binding.pry
  end

  def test_it_has_a_winner
    assert_equal @player2, @turn.winner #basic
    assert_equal @player4, @turn2.winner #war
    assert_equal "No Winner", @turn3.winner #mutually_assured_destruction
  end

  def test_it_can_pile_cards
    spoils_of_war1 = [@card1, @card2]
    spoils_of_war2 = [@card2, @card4, @card5, @card7, @card3, @card1]
    spoils_of_war3 = [@card4, @card3, @card7, @card6, @card8, @card2]

    assert_equal spoils_of_war1, @turn.pile_cards
    assert_equal spoils_of_war2, @turn2.pile_cards
    # require "pry"; binding.pry
    #says fabulous run, but outputs are duplicated in pry
    assert_equal spoils_of_war3, @turn3.pile_cards
  end

  def test_it_can_award_spoils
    require "pry"; binding.pry
    # skip
    winner1 = @turn.winner
    @turn.award_spoils(winner1)
    winner2 = @turn2.winner
    @turn2.award_spoils(winner2)

    # require "pry"; binding.pry

    #winner2, winner3 lines
    assert_equal [@card2, @card3, @card1], @turn.award_spoils(winner1) # or @turn.winner
    # require "pry"; binding.pry
    assert_equal [@card2, @card4, @card5, @card7, @card3, @card1], @turn2.award_spoils(winner2)
    assert_equal [], @turn3.award_spoils(winner)
    #split out assignments
    #assert_equal [card array], winner.deck x3 for each deck

    #this test was failing because I believe it was executing mutiple different tests
    #it was giving empty arrays to my players
    #when I executed the code in pry it all worked.
  end

  def test_it_can_start
    skip
    assert_equal "*~*~*~* Aurora has won the game! *~*~*~*", @turn.start
  end
end
