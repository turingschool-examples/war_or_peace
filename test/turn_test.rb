require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
class TurnTest < Minitest::Test
  def setup  
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @deck1 = Deck.new([@card3, @card5, @card1])
    @deck2 = Deck.new([@card6, @card5, @card4])
    @player1 = Player.new("Alex",@deck1)
    @player2 = Player.new("Another Alex",@deck2)
    @turn = Turn.new(@player1, @player2)
  end
  def test_it_exists
    assert_instance_of Turn, @turn
  end
  def test_attributes
    assert_equal @turn.player1, @player1
    assert_equal @turn.player2, @player2
    assert_equal @turn.spoils_of_war, []
    #add more tests for spoils of war after turn initiated and given all combos
  end
  def test_type
    assert_equal @turn.type, 'basic'
    #add more to check if still correct for all types 
  end
  def test_winner
    assert_equal @turn.winner, "Alex"
    #add more for different scenarios
  end
end