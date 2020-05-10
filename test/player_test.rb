require 'minitest/autorun'
require '../lib/player'
require '../lib/card'
require '../lib/deck'

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @player = Player.new('Clarisa', @deck)
  end

  def test_it_has_readable_attributes
    assert_equal "Clarisa", @player.name
    assert_equal @deck, @player.deck
  end

  def test_it_has_player_lost
    assert_equal false, @player.has_lost?

    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card

    assert_equal true, @player.has_lost?
  end



end
