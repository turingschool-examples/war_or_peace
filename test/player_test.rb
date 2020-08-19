require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    cards = []
    card = Card.new(:diamond, 'Queen', 12)
    cards << card
    deck = Deck.new(cards)
    player = Player.new("Savannah", deck)

    assert_instance_of Player, player
  end

  def test_there_are_cards
    # skip
    cards = []
    card = Card.new(:diamond, 'Queen', 12)
    cards << card
    deck = Deck.new(cards)
    player = Player.new("Savannah", deck)

    assert_equal [card], deck.cards
  end

  def test_the_cards_are_in_a_deck
    # skip
    cards = []
    card = Card.new(:heart, 'Ace', 14)
    cards << card
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_has_a_name
    # skip
    cards = []
    card = Card.new(:heart, 'Ace', 14)
    cards << card
    deck = Deck.new(cards)
    player = Player.new("Savannah", deck)

    assert_equal "Savannah", player.name
  end

  def test_there_is_a_deck_associated_with_player
    # skip
    cards = []
    card = Card.new(:heart, 'Ace', 14)
    cards << card
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    deck = Deck.new(cards)
    player = Player.new("Savannah", deck)

    assert_equal deck, player.deck
  end

  def test_a_card_can_be_removed_from_a_players_hand
    # skip
    cards = []
    card = Card.new(:heart, 'Ace', 14)
    cards << card
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    deck = Deck.new(cards)
    assert_equal 3, deck.cards.length
    player = Player.new("Savannah", deck)

    assert_equal deck, player.deck
    assert_equal 3, player.deck.cards.length
    
    assert_equal card, player.deck.remove_card
  end

  def test_a_player_has_not_lost_if_there_are_still_cards_in_their_hand
    # skip
    cards = []
    card = Card.new(:heart, 'Ace', 14)
    cards << card
    card1 = Card.new(:diamond, 'Queen', 12)
    cards << card1
    card2 = Card.new(:spade, '3', 3)
    cards << card2
    deck = Deck.new(cards)
    player = Player.new("Savannaha", deck)

    assert_equal 3, player.deck.cards.length
    player.deck.remove_card
    refute player.has_lost?
    assert_equal 2, player.deck.cards.length
    player.deck.remove_card
    player.deck.remove_card
    assert_equal 0, player.deck.cards.length
    assert player.has_lost?
  end
end
