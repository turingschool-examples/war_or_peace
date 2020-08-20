require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < MiniTest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)
    assert_instance_of Player, player
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    player.name
    player.deck
    assert_equal player.name, 'Clarisa'
    assert_equal player.deck, deck
  end

  def test_has_lost?
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal player.has_lost?, false

    player.deck.remove_card
    assert_equal player.has_lost?, false

    player.deck.remove_card
    assert_equal player.has_lost?, false

    player.deck.remove_card
    assert_equal player.has_lost?, true
  end

end
