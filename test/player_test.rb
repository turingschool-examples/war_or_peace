require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

require 'pry'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'King', 13)
    @card2 = Card.new(:club, '2', 2)
    @card3 = Card.new(:spade, '10', 10)
    @card4 = Card.new(:diamond, '8', 8)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Solah', @deck)
  end
  
  def test_it_exists
    assert_instance_of Player, @player
  end
end
