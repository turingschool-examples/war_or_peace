require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'

class TurnTest < Minitest::Test
  def setup
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)

    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)

    turn = Turn.new(player1, player2)
  end

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new('Clarisa', deck)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    cards2 = [card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
require "pry"; binding.pry

    assert_instance_of Turn, turn

  end

end
