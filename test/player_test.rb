require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Queen', 12)
    @card2 = Card.new(:diamond, '3', 3)
    @card3 = Card.new(:spade, 'King', 13)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Ryan', @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_has_a_name_attribute
    assert_equal 'Ryan', @player.name
  end

  def test_it_has_a_deck_attribute
    assert_equal @deck, @player.deck
  end

  def test_has_lost_method
    assert_equal false, @player.has_lost?

    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card

    assert_equal [], @player.deck.cards
    assert_equal true, @player.has_lost?
  end
end
