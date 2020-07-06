require "minitest/autorun"
require "minitest/pride"
require "./lib/player.rb"

class PlayerTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, "Queen", 12)
    deck1 = Deck.new([card1])
    player = Player.new("Clarisa", deck1)

    assert_instance_of Player, player
  end

  def test_it_has_a_name
    deck = Deck.new([])
    player = Player.new("Clarisa", deck)

    assert_equal "Clarisa", player.name
  end
  def test_it_can_hold_a_deck
    deck = Deck.new([])
    player = Player.new("Jon", deck)

    assert_equal deck, player.deck
  end
  def test_it_has_some_cards
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "10", 10)
    deck1 = Deck.new([card1, card2])
    player = Player.new("Clarisa", deck1)

    assert_equal [card1, card2], player.deck.cards
  end

  def test_has_player_lost?

    card1 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1])
    player = Player.new("Mary", deck1)

    assert_equal false, player.has_lost?

    player.deck.remove_card

    assert_equal true, player.has_lost?
  end

end
