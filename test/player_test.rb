require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])

    @player1 = Player.new("Clarisa", @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player1
  end

  def test_name
    assert_equal "Clarisa", @player1.name
  end

  def test_has_lost?
    deck2 = Deck.new([])
    player2 = Player.new("Harrison", deck2)
  

    assert_equal false, @player1.has_lost?
    assert_equal true, player2.has_lost?
  end
end
