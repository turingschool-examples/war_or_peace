require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_a_player_has_a_name
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      assert_equal 'Clarisa', player.name
  end

  def test_a_player_can_have_a_different_name
    player = Player.new('Carlo', Deck.new)

    assert_equal 'Carlo', player.name
  end

  def test_a_player_has_a_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_equal [card1, card2, card3], player.deck.cards
  end

  def test_a_players_default_is_an_empty_deck
    player = Player.new('Wanda', Deck.new)

    assert_equal [], player.deck.cards
  end

  def test_a_player_who_still_has_cards_has_not_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    refute player.has_lost?
  end

  def test_a_player_with_no_cards_has_lost
    player = Player.new('Susan', Deck.new)

    assert player.has_lost?
  end

end
