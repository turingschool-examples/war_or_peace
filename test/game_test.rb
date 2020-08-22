require "minitest/autorun"
require "minitest/pride"
require './lib/card'
require './lib/deck'
require "./lib/player"
require "./lib/turn"
require "./lib/game"

class GameTest < Minitest::Test
  def test_it_exists
    standard_deck = [
      card1 = Card.new(:heart, "Jack", 11),
      card2 = Card.new(:heart, "10", 10),
      card3 = Card.new(:heart, "9", 9),
      card4 = Card.new(:diamond, "Jack", 11),
      card5 = Card.new(:heart, "8", 8),
      card6 = Card.new(:diamond, "Queen", 12),
      card7 = Card.new(:heart, "3", 3),
      card8 = Card.new(:diamond, "2", 2)
    ]

    shuffled_standard_deck = standard_deck.shuffle
    shuffled1 = []
    shuffled2 = []
    4.times do
      shuffled1 << shuffled_standard_deck.shift
      shuffled2 << shuffled_standard_deck.shift
    end
    deck1 = Deck.new(shuffled1)
    deck2 = Deck.new(shuffled2)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
    assert_instance_of Game, game
  end

  def test_a_short_game_will_end
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)

    deck1 = Deck.new([card1, card2, card3])
    deck2 = Deck.new([card4, card5, card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)
    game.start
    assert_equal player2, game.game_winner
    assert_equal "*~*~*~* Aurora has won the game! *~*~*~*", game.game_ended
  end

  def test_

  end
end
