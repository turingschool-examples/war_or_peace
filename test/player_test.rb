require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require "pry"

class PlayerTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_it_has_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal 'Clarisa', player.name
  end

  def test_it_can_lose_game
    card1 = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new([card1])
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
    deck.remove_card

    assert_equal true, player.has_lost?
  end

  def test_it_can_still_designate_winner_if_not_enough_cards
    card1 = Card.new(:diamond, '10', 10)
    card2 = Card.new(:heart, '9', 9)
    card3 = Card.new(:diamond, '8', 8)
    card4 = Card.new(:spade, '10', 10)
    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards

    assert_equal true, player2.has_lost?
  end

end
