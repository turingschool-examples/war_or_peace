require './lib/deck'
require './lib/card'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < MiniTest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new(@name, @deck)
  end

  def test_it_exists

    assert_instance_of Player, @player
  end

  def test_player_has_name
    player = Player.new('Clarisa', @deck)

    assert_equal 'Clarisa', player.name
  end


end
