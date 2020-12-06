require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
    def test_player_is_there
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '5', 5)
      card3 = Card.new(:club, '8', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player =Player.new('Clarissa', deck)

      assert_instance_of Player, player
    end

    def test_player_has_name
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '5', 5)
      card3 = Card.new(:club, '8', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player =Player.new('Clarissa', deck)

      assert_equal player.name, 'Clarissa'
    end
    def test_player_has_deck
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '5', 5)
      card3 = Card.new(:club, '8', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarissa', deck)

      assert_includes(deck.cards, card1)
    end

    def test_has_player_lost
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '5', 5)
      card3 = Card.new(:club, '8', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarissa', deck)

      assert_equal false, player.has_lost
    end

    def test_player_remove_card_deck
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '5', 5)
      card3 = Card.new(:club, '8', 8)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarissa', deck)
      player.deck.remove_card

    end
end
