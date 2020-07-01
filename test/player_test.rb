require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/deck'
require './lib/card'

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @deck = Deck.new([@card1, @card2, @card3])

    @player = Player.new('Jimmy', @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_initalize
    assert_equal 'Jimmy', @player.name
  end

  def test_has_lost?
    @player.has_lost?

    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card

    assert_equal true, @player.has_lost?
  end

end
