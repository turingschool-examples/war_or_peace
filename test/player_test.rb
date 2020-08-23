require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_player_has_a_name

    player = Player.new("Matt")

    assert_equal "Matt", player.name
  end

  def test_player_starts_with_an_empty_deck

    player = Player.new("Matt")

    assert_equal [], player.deck
  end

  def test_player_gets_delt_3_cards

    card1 = Card.new(:hearts, "10", 10)
    card2 = Card.new(:spades, "Queen", 12)
    card3 = Card.new(:diamonds, "5", 5)
    deck = Deck.new([card1, card2, card3])
    player = Player.new("Edward", deck)

    assert_equal 3, player.deck.cards.count
  end

  def test_player_has_lost

    card1 = Card.new(:hearts, "10", 10)
    card2 = Card.new(:spades, "Queen", 12)
    card3 = Card.new(:diamonds, "5", 5)
    deck = Deck.new([card1, card2, card3])
    player = Player.new("Edward", deck)

    assert_equal false, player.has_lost?
    assert_equal false , player.empty_deck?

    deck.remove_card
    deck.remove_card
    deck.remove_card

    assert_equal true, player.has_lost?
    assert_equal true, player.empty_deck?
  end
end
