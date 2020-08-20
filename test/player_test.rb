require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'


class TestPlayer <Minitest::Test

  attr_reader :player, :card1, :card2, :card3
  attr_accessor :deck, :cards

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new("Clarisa", deck)
  end

  def test_player_exists
    assert_instance_of Player, player
  end

  def test_player_has_attributes
    assert_equal "Clarisa", player.name
    assert_equal deck, player.deck
  end
end
