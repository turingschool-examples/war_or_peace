require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"
require "./lib/player"

class PlayerTest < Minitest::Test
  def test_it_exists    card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      cards = [card2, card3]

      deck = Deck.new(cards)

      player = Player.new('Clarisa', deck)

      assert_instance_of Player, player
  end

  def test_it_has_name
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    assert_equal 'Clarisa', player.name
  end

  def test_it_has_a_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

    assert_equal 3, player.deck.cards.size
    assert_instance_of Deck, player.deck
  end
  def test_it_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

    assert_equal false , player.lost?
    player.deck.remove_card
    assert_equal false , player.lost?
    player.deck.remove_card
    assert_equal false , player.lost?
    player.deck.remove_card
    assert_equal true , player.lost?

    assert_equal [], player.deck.cards
  end
end
