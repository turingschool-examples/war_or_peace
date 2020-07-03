require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

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

  def test_if_win_game_happens_if_player_loses
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck1 = Deck.new([])
      deck2 = Deck.new([card1])
      player1 = Player.new('Clarisa', deck1)
      player2 = Player.new('Megan', deck2)
      turn = Turn.new(player1, player2)
      game = Game.new(turn)

      assert_equal "*~*~*~* #{player2.name} has won the game! *~*~*~*", game.win_game
  end

end
