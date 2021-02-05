require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @deck1 = Deck.new([@card3, @card2, @card1,@card6, @card5, @card4])
    @player = Player.new("Alex",@deck1)
  end
  def test_it_exists
    assert_instance_of Player, @player
  end
  def test_lost
    assert_equal @player.has_lost?, false
    @player.deck.cards.clear
    assert_equal @player.has_lost?, true
  end
end