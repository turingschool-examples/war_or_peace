require 'minitest/autorun'
require 'minitest/pride'
require "./lib/deck"
require "./lib/card"
require './lib/turn'
require './lib/player'



class TurnTest < Minitest::Test

    def test_it_exists
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spades, '3', 3)
      card3 = Card.new(:heart, 'Ace', 11)
      card4 = Card.new(:heart, '5', 5)

      cards = [card1, card2]
      cards1 = [card3, card4]
      deck1 = Deck.new(cards)
      deck2 = Deck.new(cards1)

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      assert_instance_of Turn, turn
    end

    def test_it_has_3_types
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spades, '3', 3)
      card3 = Card.new(:heart, 'Ace', 11)
      card4 = Card.new(:heart, '5', 5)

      cards = [card1, card2]
      cards1 = [card3, card4]
      deck1 = Deck.new(cards)
      deck2 = Deck.new(cards1)

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      assert_equal turn.type, :basic

    end



  end
