require 'minitest/autorun'
require 'minitest/pride'
require '../lib/player'
require '../lib/deck'
require '../lib/card'
require 'pry'

class PlayerTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarissa', deck)

    assert_instance_of Player, player
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarissa', deck)

    assert_equal 'Clarissa', player.name
    assert_equal deck, player.deck
  end

  def test_has_player_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards1 = [card1, card2, card3]
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([])
    player1 = Player.new("Clarissa", deck1)
    player2 = Player.new("Elmie", deck2)

    assert_equal false, player1.has_lost?
    assert_equal true, player2.has_lost?
  end
end
