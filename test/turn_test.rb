require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class TurnTest < MiniTest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    deck = Deck.new(@cards)
    player1 = Player.new("Jenny", deck)

    @card4 = Card.new(:diamond, '10', 10)
    @card5 = Card.new(:spade, '5', 5)
    @card6 = Card.new(:heart, 'King', 13)
    @cards2 = [@card4, @card5, @card6]
    deck2 = Deck.new(@cards2)
    player2 = Player.new("Marisa", deck2)

    turn = Turn.new(player1,player2)
  end

  def test_it_exists
    turn = setup

    assert_instance_of Turn, turn
  end
end
