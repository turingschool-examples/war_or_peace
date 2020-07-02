require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require "pry"

class PlayerTest < Minitest::Test
  def test_player_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jared", deck)
    assert_instance_of Player, player1
  end

  def test_player_loss
    cards = []
    deck = Deck.new(cards)
    player1 = Player.new("Jared", deck)
    player1.has_lost?(player1)
    assert_equal true, player1.has_lost?(player1)
  end
end
