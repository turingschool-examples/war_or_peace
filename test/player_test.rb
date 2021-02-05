require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_player_exists
    player = Player.new('Clarisa', deck=[])

    assert_instance_of Player, player
  end

  def test_if_player_lost
    # skip

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1,card2,card3]

    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal 'Clarisa', player.name
    assert_equal deck, player.deck
    assert_equal false, player.has_lost?
    # require "pry"; binding.pry

    assert_equal card1, player.deck.remove_card
    assert_equal false, player.has_lost?

    assert_equal card2, player.deck.remove_card
    assert_equal false, player.has_lost?

    assert_equal card3, player.deck.remove_card
    assert_equal true, player.has_lost?

    assert_equal deck, player.deck
  end
end
