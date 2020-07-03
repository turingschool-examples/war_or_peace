require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"
require "./lib/standard_deck"
require "./lib/game"

class GameTest < Minitest::Test

  def test_it_exists
    standard_deck = StandardDeck.new
    cards = standard_deck.cards.shuffle
    deck1 = Deck.new(cards[0..25])
    deck2 = Deck.new(cards[26..52])

    player1 = Player.new("Saryn", deck1)
    player2 = Player.new("Dan", deck2)

    game = Game.new(player1, player2)

    assert_instance_of Game, game
  end

  #def test_it_has_attributes
  #end

end
