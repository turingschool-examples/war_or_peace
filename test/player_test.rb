require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_player_has_a_name?
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player.name
    require "pry"; binding.pry
  end

  # def player_has_a_deck
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  #   player = Player.new('Clarisa', deck)
  #
  #   assert_equal [card1, card2, card3], player.deck
  #   require "pry"; binding.pry
  # end

  # def player_has_lost?
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  #   player = Player.new('Clarisa', deck)
  #
  #   assert_equal false, player.has_lost?
  #
  #   require "pry"; binding.pry
  # end

  # def remove_card_from_deck
  #   card1 = Card.new(:diamond, 'Queen', 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, 'Ace', 14)
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  #   player = Player.new('Clarisa', deck)
  #
  #   assert_equal [Card2, Card3], player.deck.remove_card
  #   assert_equal false, player.has_lost?
  #   assert_equal [Card3], player.deck.remove_card
  #   assert_equal false, player.has_lost?
  #   assert_equal [], player.deck.remove_card
  #   assert_equal true, player.has_lost?
  #   assert_equal [], player.deck
  # end

end
