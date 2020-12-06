require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    player1 = Player.new('Megan', Deck.new([]))
    player2 = Player.new('Aurora', Deck.new([]))
    max_turns = 1

    game = Game.new(player1, player2)

    assert_instance_of(Game, game);
  end

  def test_it_has_readable_attributes
    player1 = Player.new('Megan', Deck.new([]))
    player2 = Player.new('Aurora', Deck.new([]))

    game = Game.new(player1, player2)

    assert_equal player1, game.player1
    assert_equal player2, game.player2
  end

  def test_start
    player1 = Player.new('Megan', Deck.new([]))
    player2 = Player.new('Aurora', Deck.new([]))

    game = Game.new(player1, player2)

    assert_instance_of(String, game.start)
  end
end
