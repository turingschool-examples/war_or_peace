require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_player_exists
    deck = Deck.new([])
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_player_has_a_name
    deck = Deck.new([])
    player = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player.name
  end

  def test_player_has_a_deck
    deck = Deck.new([])
    player = Player.new('Clarisa', deck)

    assert_equal deck, player.deck
  end

  def test_player_hasnt_lost_by_default
    cards = []
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    refute player.has_lost?
  end

  def test_player_removes_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    assert_???
  end

  def test_player_doesnt_lose_when_they_have_cards

    refute player.has_lost?
  end

  def test_player_loses_when_they_have_no_cards

    assert player.has_lost?
  end

end
