require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'


class TestPlayer <Minitest::Test

  attr_reader :name, :card1, :card2, :card3, :card4
  attr_accessor :deck, :expected, :cards

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(cards)
    @player = 'Clarisa'
  end

  def test_player_exists
    assert_instance_of Player, player
  end
