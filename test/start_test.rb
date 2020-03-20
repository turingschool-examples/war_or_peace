require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/start'
require "pry"

class StartTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:club, '3', 3)
    cards1 = [card1, card1]
    cards2 = [card2, card2]
    deck1 = Deck.new(cards1)
    deck2 = Deck.new(cards2)
    player1 = Player.new('Shark', deck1)
    player2 = Player.new('Guppie', deck2)
    turn = Turn.new(player1, player2)
    start = Start.new(turn)

    assert_instance_of Start, start

  end


end #final
