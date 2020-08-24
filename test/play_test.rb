require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/play'
require 'minitest/autorun'
require 'minitest/pride'

class TurnTest <Minitest::Test
  def test_create_big_deck

  play = Play.new

  assert_instance_of Play, play

  end

  def test_create_two_players
    play = Play.new
    play.create_big_deck
    play.randomize
    play.create_two_decks
    play.create_player_one
    play.create_player_two
    require "pry";binding.pry
  end
end
