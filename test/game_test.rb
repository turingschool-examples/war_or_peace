require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
  deck1 = []
  deck2 = []
  deck  = Deck.new
  deck.generate_standard_deck
  deck.randomize_deck
  deck.split_deck(deck1, deck2)

  player1 = Player.new('Megan', deck1)
  player2 = Player.new('Aurora', deck2)

  game = Game.new(player1, player2)

  assert_instance_of Game, game
  end

  def test_number_of_turns
    deck1 = []
    deck2 = []
    deck  = Deck.new
    deck.generate_standard_deck
    deck.randomize_deck
    deck.split_deck(deck1, deck2)

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)

    game = Game.new(player1, player2)

    game.start
  end

end
