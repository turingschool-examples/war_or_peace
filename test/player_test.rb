require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])

  end
  def test_player_exists

    player = Player.new('Clarisa', @deck)
    assert_instance_of Player, player
  end

  def test_player_name

    player = Player.new('Clarisa', @deck)
    assert_equal 'Clarisa', player.name
  end

  def test_player_deck
    
    player = Player.new('Clarisa', @deck)
    assert_equal @deck, player.deck
  end

  def test_has_lost?

    player = Player.new('Clarisa', @deck)

    assert_equal false, player.has_lost?
  end

  def test_has_lost_after_removing_cards
    player = Player.new('Clarisa', @deck)
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    assert_equal true, player.has_lost?
  end
end
