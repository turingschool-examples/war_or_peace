require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    card = Card.new(:diamond, 'Queen', 12)
    assert_instance_of Card, card
  end

  def test_it_has_another_card_that_exists
    card = Card.new(:spade, '3', 3)
    assert_instance_of Card, card
  end

  def test_it_has_a_third_card_that_exists
    card = Card.new(:heart, 'Ace', 14)
    assert_instance_of Card, card
  end

  def test_it_has_a_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal cards, deck.cards
  end

  def test_it_has_a_player
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    assert_equal 'Clarisa', player.name
    assert_equal deck, player.deck
  end

  def test_it_has_won
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
    assert_equal false, player.has_lost?
  end
end
