require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
    @deck = Deck.new(@cards)
    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_has_a_name_and_a_deck
    @deck.add_card(@card1)
    @deck.add_card(@card2)
    @deck.add_card(@card3)

    assert_equal "Clarisa", @player.name
    assert_equal @deck, @player.deck
  end

  def test_player_loses_when_deck_is_empty
    @deck.add_card(@card1)
    @deck.add_card(@card2)
    @deck.add_card(@card3)

    assert_equal false, @player.has_lost?

    @player.deck.remove_card

    assert_equal false, @player.has_lost?

    @player.deck.remove_card

    assert_equal false, @player.has_lost?

    @player.deck.remove_card

    assert_equal true, @player.has_lost?

    assert_equal @deck, @player.deck
  end
end
