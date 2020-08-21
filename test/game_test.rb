require 'minitest/autorun'
require 'minitest/pride'
require './war_or_peace_runner'

class GameTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @card9 = Card.new(:diamond, '8', 8)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @game = Game.new(@player1, @player2)
  end

  def test_it_exists
    skip
    assert_instance_of Game, @game
  end

  def test_welcome_message
    skip
    assert_equal "GO", @game.welcome_message
  end

  def test_turn_message
    @turn.type = :basic

    assert_equal "Turn 1: Megan won 2 cards"
  end
end
