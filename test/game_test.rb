require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

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

    assert_instance_of Game, @game
  end

  def test_welcome_message
    expected ="Welcome to War! (or Peace) This game will be played with 52 cards.\n The players today are #{@player1} and #{@player2}.\n Type 'GO' to start the game!\n ------------------------------------------------------------------"
    assert_equal expected, @game.welcome_message
  end
end
