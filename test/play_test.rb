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

  def test_create_two_decks
    play = Play.new
    play.create_big_deck
    play.randomize
require "pry";binding.pry
    assert_equal [@deck1, @deck2], play.create_two_decks
  end
end
