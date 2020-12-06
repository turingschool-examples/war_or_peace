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
    # skip
    deck = Deck.new
    player = Player.new("Clarisa", deck)
    assert_instance_of Deck, player.deck
  end

  def test_can_add_cards_to_the_deck
    #skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    assert_equal 3, player.deck.cards.length
  end

  def test_to_remove_a_card
    #skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    assert_equal 2, player.deck.cards.length
  end

  def test_if_you_have_lost
    #skip
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    refute player.has_lost?
  end

  def test_that_you_lose_with_no_cards_left
    #skip
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

  def test_players_can_create_shuffled_decks
    #skip
    deck1 = Deck.new
    deck2 = Deck.new
    deck1.new_deck
    deck2.new_deck
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    assert_equal 52, player1.deck.cards.length
    assert_equal 52, player2.deck.cards.length
  end
end
