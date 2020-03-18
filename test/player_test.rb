require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_instance_of Card, card1
    assert_instance_of Card, card2
    assert_instance_of Card, card3
    assert_instance_of Deck, deck
    assert_instance_of Player, player
  end

  def test_player_loses
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal [card1, card2, card3], deck.cards
    assert_equal false, player.has_lost?

    player.deck.remove_card
    assert_equal [card2, card3], deck.cards
    assert_equal false, player.has_lost?

    player.deck.remove_card
    assert_equal [card3], deck.cards
    assert_equal false, player.has_lost?

    player.deck.remove_card
    assert_equal [], deck.cards

    assert_equal true, player.has_lost?
  end
end
