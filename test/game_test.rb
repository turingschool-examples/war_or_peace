require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/player'
require './lib/card'
require './lib/turn'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    game = Game.new(turn)
    assert_instance_of Game, game
  end

  def test_welcome
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    game = Game.new(turn)

    assert = "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
    test = game.start
    assert_equal assert, test
  end

  def test_play_basic_player1_win

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    game = Game.new(turn)
    assert_equal "*~*~*~* Megan has won the game! *~*~*~*", game.play
  end
end
