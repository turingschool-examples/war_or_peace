require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new('Trevor', @deck)
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)

    @player = Player.new('Trevor', @deck)
  end

  def test_if_player_exists

    assert_instance_of Player, @player

  end

  def test_if_player_has_readable_attributes


    assert_equal "Trevor", @player.name
    assert_equal @deck, @player.deck
  end

  def test_if_player_has_lost

    assert_equal false, @player.has_lost?
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card
    assert_equal true, @player.has_lost?
  end
end
