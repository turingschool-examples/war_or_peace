require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Player, @player
    assert_equal "Clarisa", @player.name
    assert_equal [@card1, @card2, @card3], @player.deck
  end

  def test_player_has_lost
    assert_equal false, @player.has_lost?
    @player.deck.remove_card
    assert_equal false, @player.has_lost?
    @player.deck.remove_card
    assert_equal true, @player.has_lost
    assert_equal [], @player.deck
  end

end
