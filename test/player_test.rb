require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    cards = []
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_player_has_name
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player.name
  end

  def test_player_has_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal deck, player.deck
  end

  def test_if_player_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    # binding.pry
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    assert_equal true, player.has_lost?
  end

  def test_if_player_removes_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal card1, deck.remove_card
    assert_equal card2, deck.remove_card
    assert_equal card3, deck.remove_card
  end

end
