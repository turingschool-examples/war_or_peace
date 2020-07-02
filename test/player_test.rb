require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'
require '../lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
  #skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_it_has_a_name
    #skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal 'Clarisa', player.name
  end

  def test_it_has_a_deck_with_cards
    #skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal [card1, card2, card3], player.deck.cards
  end

  def test_it_has_lost
    #skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    refute player.has_lost?

    player.deck.remove_card
    refute player.has_lost?

    player.deck.remove_card
    refute player.has_lost?

    player.deck.remove_card
    assert player.has_lost?

    assert_equal [], player.deck.cards
  end

end
