require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/Game'
require "pry"

class GameTest < Minitest::Test

   def test_it_exists
     card1 = Card.new(:heart, 'Jack', 11)
     card2 = Card.new(:heart, '10', 10)
     deck1 = Deck.new([card1])
     deck2 = Deck.new([card2])
     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)
     game = Game.new

     assert_instance_of Game, game
   end

   def test_it_can_start_and_get_user_input
     card1 = Card.new(:heart, 'Jack', 11)
     card2 = Card.new(:heart, '10', 10)
     deck1 = Deck.new([card1])
     deck2 = Deck.new([card2])
     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)
     game = Game.new
     game.start(player1, player2)

     assert_equal "GO", reply
   end
end
