require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_it_exists
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
     deck = Deck.new([card1, card2, card3])
     player = Player.new('Clarisa', deck)

     assert_instance_of(Player, player)

  end

  def test_it_has_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal deck, player.deck
    assert_equal 'Clarisa', player.name
  end

  def test_player_has_not_lost_by_default
    skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?

  end

  def test_player_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    player.deck.remove_card

    assert_equal false, player.has_lost?

    player.deck.remove_card

    assert_equal false, player.has_lost?

    player.deck.remove_card

    assert_equal true, player.has_lost?

    assert_equal deck, player.deck

    assert_equal 0, player.deck.cards.length
  end

end
