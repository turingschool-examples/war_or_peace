require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test

  def setup

    @card1 = Card.new('heart', '5', 5)
    @card2 = Card.new('spade', 'jack', 11)
    @card3 = Card.new('diamond', 'ace', 14)
    @cards1 = [@card1, @card2, @card3]
    @deck1 = Deck.new(@cards1)
    @player1 = Player.new('Megan', @deck1 )

    @card4 = Card.new('club', '5', 5)
    @card5 = Card.new('heart', 'king', 13)
    @card6 = Card.new('club', '8', 8)
    @cards2 = [@card4, @card5, @card6]
    @deck2 = Deck.new(@cards2)
    @player2 = Player.new('Aurora', @deck2)
    @turn = Turn.new(@player1, @player2)
    @game = Game.new(@turn)

  end

  def test_game_exits
    assert_instance_of Game, @game
  end

  def test_welcome
    @game.welcome
  end



end
