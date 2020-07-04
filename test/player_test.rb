require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  # I'm again not sure how to utilize these things...
  # def setup
  #   @card1 = Card.new(:diamond, 'Queen', 12)
  #   @card2 = Card.new(:spade, '3', 3)
  #   @card3 = Card.new(:heart, 'Ace', 14)
  #   @cards = [@card1, @card2, @card3]
  #   @deck = Deck.new(@cards)
  #   @name = name
  #   @player = Player.new(name, @deck)
  # end

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    name = name
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_has_name
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    name = name
    player = Player.new('Clarisa', deck)

    assert_equal 'Clarisa', player.name
  end


end
