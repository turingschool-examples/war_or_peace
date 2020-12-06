require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_turn_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '5', 5)
    card3 = Card.new(:club, '8', 8)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Megan', deck)
    player2 = Player.new('Aurora', deck)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end
end
