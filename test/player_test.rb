require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

  player.name
  assert_instance_of Player, player
  player.deck
  assert_instance_of Deck, deck
  assert_equal deck, player.deck
  end

  def test_has_lost?
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    refute player.has_lost?
    player.deck.remove_card
    refute player.has_lost?
    player.deck.remove_card
    refute player.has_lost?
    player.deck.remove_card
    player.has_lost?
    assert player.has_lost?

    player.deck
    assert_equal deck, player.deck
  end

  def
  end 

  end
end
