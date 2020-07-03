require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

# Testing the basic turn type
  def test_it_has_basic_turn_type
    assert_equal :basic, @turn.type
  end

  def test_it_returns_winner_for_basic
    assert_equal @player1, @turn.winner
  end

# Testing the war turn type
  def test_it_has_war_turn_type
    assert_equal :war, @turn.type
  end

  def test_it_returns_winner_for_war
    assert_equal @player2, @turn.winner
  end
  
# Testing the M.A.D turn type
  def test_it_has_mutually_assured_destruction_turn_type
    assert_equal :mutually_assured_destruction, @turn.winner
  end

  def test_it_returns_winner_for_mutually_assured_destruction
    assert_equal "No Winner", @turn.winner

end
