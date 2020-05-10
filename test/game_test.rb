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

    @basic_turn_deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @basic_turn_deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @basic_turn_player1 = Player.new("Megan", @basic_turn_deck1)
    @basic_turn_player2 = Player.new("Aurora", @basic_turn_deck2)

    @basic_turn = Turn.new(@basic_turn_player1, @basic_turn_player2)

    @game = Game.new(@basic_turn)

    l1 = "Welcome to War! (or Peace). This game will be played with 52 cards."
    l2 = "The players today are #{@basic_turn.player1.name} and #{@basic_turn.player2.name}."
    l3 = "Type 'GO' to start the game!"
    l4 = "------------------------------------------------------------------"
    @welcome_message = "#{l1} \n" + "#{l2} \n" + "#{l3} \n" + "#{l4}"
    # @welcome_message = "Welcome to War! (or Peace). This game will be played with 52 cards.\n" + "The players today are Megan and Aurora.\n" + "Type 'GO' to start the game!\n" + "------------------------------------------------------------------"
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_welcomes_you_to_game_upon_start
    @game.start

    assert_equal @welcome_message, @game.start
  end
end
