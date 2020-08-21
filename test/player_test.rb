require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def cards_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    @cards = [card1, card2, card3]
    deck = Deck.new(@cards)
  end


  def test_it_exists_and_has_attributes

    player = Player.new('Clarisa', @deck)

    assert_instance_of Player, player
    assert_equal 'Clarisa', player.name
    assert_equal @deck, player.deck
  end

  def test_has_lost?
    card2 = Card.new(:spade, '3', 3)
    player = Player.new('Clarisa', @deck)

    assert_equal false, player.has_lost?
    assert_equal card2, @deck.remove_card
  end





end
