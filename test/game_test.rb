require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require "pry"

class GameTest < Minitest::Test

   def test_it_exists
     card1 = Card.new(:heart, 'Jack', 11)
     card2 = Card.new(:heart, '10', 10)
     deck1 = Deck.new([card1])
     deck2 = Deck.new([card2])
     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)
     game = Game.new(player1, player2)

     assert_instance_of Game, game
   end

   # def test_take_a_turn_creates_new_turn_class_instance
   #   card1 = Card.new(:heart, 'Jack', 11)
   #   card2 = Card.new(:heart, '10', 10)
   #   deck1 = Deck.new([card1])
   #   deck2 = Deck.new([card2])
   #   player1 = Player.new("Megan", deck1)
   #   player2 = Player.new("Aurora", deck2)
   #   game = Game.new(player1, player2)
   #   game.take_a_turn
   #
   #   assert_instance_of Turn, game.turn
   # end

   def test_it_can_take_a_turn
     card1 = Card.new(:heart, 'Jack', 11)
     card2 = Card.new(:heart, '10', 10)
     deck1 = Deck.new([card1])
     deck2 = Deck.new([card2])
     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)
     game = Game.new(player1, player2)
     game.take_a_turn

     assert_equal false, @turn_count == 0
   end

   def test_it_can_break_continue_playing_loop
     card1 = Card.new(:diamond, '10', 10)
     card2 = Card.new(:heart, '9', 9)
     card3 = Card.new(:diamond, '7', 7)
     card4 = Card.new(:heart, '10', 10)
     card5 = Card.new(:diamond, '2', 2)
     card6 = Card.new(:heart, '8', 8)
     card7 = Card.new(:spade, '4', 4)
     card8 = Card.new(:club, '6', 6)
     deck1 = Deck.new([card1, card2, card3, card7])
     deck2 = Deck.new([card4, card5, card6, card8])
     player1 = Player.new("Megan", deck1)
     player2 = Player.new("Aurora", deck2)
     game = Game.new(player1, player2)
     game.@turn_count = 999
     game.take_a_turn

     assert_equal 1000, @turn_count
   end

   # def test_it_can_handle_no_winner_in_case_of_mutually_assured_destruction
   #   card1 = Card.new(:diamond, '10', 10)
   #   card2 = Card.new(:heart, '9', 9)
   #   card3 = Card.new(:diamond, '8', 8)
   #   card4 = Card.new(:heart, '10', 10)
   #   card5 = Card.new(:diamond, '2', 2)
   #   card6 = Card.new(:heart, '8', 8)
   #   card7 = Card.new(:spade, '4', 4)
   #   card8 = Card.new(:club, '6', 6)
   #   deck1 = Deck.new([card1, card2, card3, card7])
   #   deck2 = Deck.new([card4, card5, card6, card8])
   #   player1 = Player.new("Megan", deck1)
   #   player2 = Player.new("Aurora", deck2)
   #   game = Game.new(player1, player2)
   #   game.take_a_turn
   #
   #   assert_equal :mutually_assured_destruction, game.turn.type
   # end
end
