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
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists
    assert_instance_of Card, @card1
    assert_instance_of Card, @card2
    assert_instance_of Card, @card3
    assert_instance_of Deck, @deck
    assert_instance_of Player, @player
  end

  def test_it_has_readable_attributes
    assert_equal "Clarisa", @player.name
    assert_equal @deck, @player.deck
  end

  def test_has_lost?
    assert_equal false, @player.has_lost?

    3.times do
      @player.deck.remove_card
    end
    assert_equal true, @player.has_lost?
  end
end
