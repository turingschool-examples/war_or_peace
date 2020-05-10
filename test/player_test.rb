require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require 'pry'


class PlayerTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_it_has_a_name
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player.name
  end

  def test_it_returns_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal deck, player.deck
  end

  def test_it_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
  end

  def test_it_can_remove_card_from_player_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal 3, player.deck.cards.count
    assert_equal card1, player.deck.remove_card
    assert_equal 2, player.deck.cards.count
    assert_equal card2, player.deck.remove_card
    # binding.pry
  end

  def test_it_knows_when_your_player_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
    assert_equal card1, player.deck.remove_card
    assert_equal false, player.has_lost?
    assert_equal 2, player.deck.cards.count
    assert_equal card2, player.deck.remove_card
    assert_equal false, player.has_lost?
    assert_equal 1, player.deck.cards.count
    assert_equal false, player.has_lost?
    assert_equal card3, player.deck.remove_card
    assert_equal 0, player.deck.cards.count
    assert_equal true, player.has_lost?
  end

end
