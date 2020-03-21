require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @cards = [
      card1 = Card.new(:diamond, "Queen", 12),
      card2 = Card.new(:spades, "Ace", 13),
      card3 = Card.new(:hearts, "Nine", 9)
    ]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    player = Player.new(@deck, "Clarisa")

    assert_instance_of Player, player

  end

  def test_player_has_a_name
    player = Player.new(@deck, "Clarisa" )

    assert_equal "Clarisa", player.name

  end

  def test_player_has_a_deck
    player = Player.new(@deck, "Clarisa" )

    assert_equal @deck, player.deck
  end

  def test_has_lost?
    @cards = [
      card1 = Card.new(:diamond, "Queen", 12),
      card2 = Card.new(:spades, "Ace", 13),
      card3 = Card.new(:hearts, "Nine", 9)
    ]
    player = Player.new(@deck, "Clarisa" )

    assert_equal false, player.has_lost?
  end


end
