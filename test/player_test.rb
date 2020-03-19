require 'minitest/autorun'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'

class PlayerTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new("Clarissa", deck)

    assert_instance_of Player, player
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new("Clarissa", deck)

    assert_equal "Clarissa", player.name
    assert_equal deck, player.deck
  end

  def test_it_can_tell_if_player_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new("Clarissa", deck)

    assert_equal false, player.has_lost

    player.deck.remove_card
    assert_equal false, player.has_lost

    player.deck.remove_card
    assert_equal false, player.has_lost

    player.deck.remove_card
    assert_equal true, player.has_lost
    assert_equal [], player.deck.cards

  end
end
