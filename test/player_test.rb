require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'Ace', 14)
    @card3 = Card.new(:heart, '3', 3)
    @cards = [@card1, @card2, @card3]
    @cards2 = []
    @deck = Deck.new(@cards)
    @deck2 = Deck.new(@cards2)
    @player1 = Player.new('Clarisa', @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player1
  end

  def test_player_has_a_name
    assert_equal 'Clarisa', @player1.name
  end

  def test_player_has_a_deck
    assert_equal @deck, @player1.deck
  end

  def test_that_player_has_lost
    player2 = Player.new('Harry', @deck2)
    # require "pry"; binding.pry

    assert_equal false, @player1.has_lost?
    assert_equal true, player2.has_lost?
  end
end
