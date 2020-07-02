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

    def test_it_has_a_standard_52_card_deck
        game = Game.new("Megan", "Aurora")
        game.generate_deck
        assert_equal 52, game.deck.cards.count
    end




end