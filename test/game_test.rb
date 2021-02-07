require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

#Note: switched to testing via turn_test.rb and war_or_peace_runner.rb
class GameTest < Minitest::Test

  def test_create_players_and_decks
    Game.new.create_players_and_decks("Megan")

    assert_equal 52, @deck1.cards.length
  end
end
