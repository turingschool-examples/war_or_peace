require './lib/deck'
require './lib/card'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
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

    assert_equal 'Clarisa', player.name
  end

  def test_player_has_a_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal deck, player.deck
    assert_instance_of Deck, player.deck
  end

  def test_player_can_lose
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    refute player.has_lost?

    player.deck.remove_card
    refute player.has_lost?

    player.deck.remove_card
    refute player.has_lost?

    player.deck.remove_card
    assert player.has_lost?
    assert_equal [], player.deck.cards
  end



end
