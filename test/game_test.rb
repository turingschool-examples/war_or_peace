require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    card_generator = CardGenerator.new
    card_generator.make_standard_deck

    shuffle_cards = card_generator.full_card_deck.shuffle
    deck1 = Deck.new(shuffle_cards.slice(1..26))
    deck2 = Deck.new(shuffle_cards.slice(27..52))
    
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    card_generator = CardGenerator.new
    card_generator.make_standard_deck

    shuffle_cards = card_generator.full_card_deck.shuffle
    deck1 = Deck.new(shuffle_cards.slice(1..26))
    deck2 = Deck.new(shuffle_cards.slice(27..52))

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_equal player1, game.player1
    assert_equal player2, game.player2
  end
end
