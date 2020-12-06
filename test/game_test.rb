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

  def test_it_returns_player_name_in_win_output
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '10', 10)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card5, card2, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_equal "*~*~*~* Megan has won the game! *~*~*~*", game.win_output(player1)
    assert_equal "*~*~*~* Aurora has won the game! *~*~*~*", game.win_output(player2)
  end

end
