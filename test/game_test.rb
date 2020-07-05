require './lib/game'
require './lib/player'
require './lib/deck'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest::Test
 # QUESTION: how do I pass values like players from runner
 # file to here?
  def setup
    # General Setup
     @card1 = Card.new(:heart, 'Jack', 11)
     @card2 = Card.new(:heart, '10', 10)
     @card3 = Card.new(:heart, '9', 9)
     @card4 = Card.new(:diamond, 'Jack', 11)
     @card5 = Card.new(:heart, '8', 8)
     @card6 = Card.new(:diamond, 'Queen', 12)
     @card7 = Card.new(:heart, '3', 3)
     @card8 = Card.new(:diamond, '2', 2)

     # Bacic Turn
     deck1 = Deck.new([@card1, @card2, @card5, @card8])
     deck2 = Deck.new([@card3, @card4, @card6, @card7])

     @player1 = Player.new("Megan", deck1)
     @player2 = Player.new("Aurora", deck2)

    @greeting = "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are #{@player1.name} and #{@player2.name}.\nType 'GO' to start the game!\n------------------------------------------------------------------"

   end

  def test_it_exists
    game = Game.new(@player1, @player2)

    assert_instance_of Game, game
  end

  def test_it_gives_a_greeting
    game = Game.new(@player1, @player2)

    assert_equal @greeting, game.display_greeting
  end

  # Deal with input verification
  def test_it_gets_user_input
    game = Game.new(@player1, @player2)

    assert_instance_of String, game.get_user_input
  end

  # def test_it_DRAWs_after_1mil_turn
  #   game = Game.new(@player1, @player2)
  #
  #
  # end
end
