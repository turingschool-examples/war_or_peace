require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
# require './lib/war_or_peace_runner'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new('Frank', 'Joe')
    assert_instance_of Game, game
  end

  def test_it_reads_player_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)

    deck1 = [card1, card3]
    deck2 = [card2, card4]

    player1 = Player.new('April', deck1)
    player2 = Player.new('July', deck2)

    game = Game.new(player1, player2)

    assert_equal 'April', game.player1.name
    assert_equal 'July', game.player2.name
    assert_equal [card1, card3], game.player1.deck
    assert_equal [card2, card4], game.player2.deck
  end
end
