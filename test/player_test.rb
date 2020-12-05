require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_there_can_be_a_player
    # skip
    player = Player.new("Clarisa")

    assert_instance_of Player, player
  end

  def test_player_can_have_a_name
    # skip
    player = Player.new("Clarisa")

    assert_equal "Clarisa", player.name
  end

  def test_player_starts_with_a_deck
    #want the player to have a deck
    # skip
    deck = Deck.new
    player = Player.new("Clarisa", deck)
    assert_instance_of Deck, player.deck
  end

  def test_can_add_cards_to_the_deck

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    assert_equal 3, player.deck.cards.length
  end

  def test_to_remove_a_card

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    assert_equal 2, player.deck.cards.length
  end

  def test_if_you_have_lost

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    refute player.has_lost?
  end

  def test_that_you_lose_with_no_cards_left

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card
    assert player.has_lost?
  end

  def test_player_can_create_shuffled_deck

    deck = Deck.new
    deck.new_deck
    player = Player.new('Megan', deck)
    # player.new_deck
    # require "pry"; binding.pry
    assert_equal 52, player.deck.cards.length
  end
end
