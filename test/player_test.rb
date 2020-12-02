require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_there_can_be_a_player
    player = Player.new("Clarisa")

    assert_instance_of Player, player
  end

  def test_player_can_have_a_name
    #skip
    player = Player.new("Clarisa")

    assert_equal "Clarisa", player.name
  end

  def test_player_can_have_a_deck
    #skip
    player = Player.new("Clarisa")

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new
    deck.add_card(card1)
    deck.add_card(card2)
    deck.add_card(card3)
    assert_equal 3, player.deck.length
  end
end
