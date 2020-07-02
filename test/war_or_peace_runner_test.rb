require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace_runner.rb'
require "pry"

class GameTest < Minitest::Test

    def test_it_exists
        game = Game.new("Megan", "Aurora")
        assert_instance_of Game, game
    end

    # def test_it_has_a_standard_52_card_deck
    #     game = Game.new("Megan", "Aurora")
    #     # game.generate_deck
    #     assert_equal 52, game.deck.cards.count
    # end

    # Create two players with each of the decks created out of the main one.
    def test_it_splits_the_deck_and_creates_two_players
        game = Game.new("Megan", "Aurora")

        assert_equal "Megan" , game.player1.name
        assert_equal 26 , game.player1.deck.cards.length
        assert_equal "Aurora" , game.player2.name
        assert_equal 26 , game.player2.deck.cards.length
    end

    # def test_game_starts
    #     game = Game.new("Megan", "Aurora")
    #     game.start
    # end

end

# Create a method to "start" (maybe make a new game.rb class file for method start)

    # User types "Go" and sees: When we start the game by running ruby war_or_peace_runner.rb, it should produce the following interaction from the command line: Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora.Type 'GO' to start the game!
    #User sees each turn info after playing
    #show the winner
    #it can be a draw