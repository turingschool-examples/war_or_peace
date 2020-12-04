require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    game = Game.new
    assert_instance_of StandardDeck, game.standard_deck
    assert_equal [], game.turns
  end

  def test_add_turn
    game = Game.new
    game.create_two_players("Angel", "Chris")
    game.add_turn

    assert_equal 1, game.turns.length

    game.add_turn
    assert_equal 2, game.turns.length
  end

  def test_create_first_deck
    game = Game.new
    game.standard_deck.create_standard_deck
    shuffled_deck = game.standard_deck.cards.shuffle

    assert_instance_of Deck, game.create_first_deck(shuffled_deck[0..25])
  end

  def test_create_second_deck
    game = Game.new
    game.standard_deck.create_standard_deck
    shuffled_deck = game.standard_deck.cards.shuffle

    assert_instance_of Deck, game.create_second_deck(shuffled_deck[26..52])
  end

  def test_create_first_player
    game = Game.new
    game.standard_deck.create_standard_deck
    shuffled_deck = game.standard_deck.cards.shuffle
    deck = game.create_first_deck(shuffled_deck[0..25])

    assert_instance_of Player, game.create_first_player("Angel", deck)
    assert_equal "Angel", game.create_second_player("Angel", deck).name
    assert_instance_of Deck, game.create_second_player("Angel", deck).deck
  end

  def test_create_second_player
    game = Game.new
    game.standard_deck.create_standard_deck
    shuffled_deck = game.standard_deck.cards.shuffle
    deck = game.create_first_deck(shuffled_deck[26..52])

    assert_instance_of Player, game.create_second_player("Amber", deck)
    assert_equal "Amber", game.create_second_player("Amber", deck).name
    assert_instance_of Deck, game.create_second_player("Amber", deck).deck
  end

  def test_game_over
    game = Game.new

    game.standard_deck.create_standard_deck
    shuffled_deck = game.standard_deck.cards.shuffle
    deck1 = game.create_first_deck(shuffled_deck[0..25])
    deck2 = game.create_second_deck(shuffled_deck[26..52])
    player1 = game.create_first_player("Angel", deck1)
    player2 = game.create_second_player("Amber", deck2)

    assert_equal false, game.game_over?

    23.times do
      deck1.remove_card
    end

    assert_equal true, game.game_over?
  end

  def test_display_winner
    game = Game.new
    game.standard_deck.create_standard_deck
    shuffled_deck = game.standard_deck.cards.shuffle
    deck1 = game.create_first_deck(shuffled_deck[0..25])
    deck2 = game.create_second_deck(shuffled_deck[26..52])
    player1 = game.create_first_player("Angel", deck1)
    player2 = game.create_second_player("Amber", deck2)

    25.times do
      deck1.remove_card
    end

    assert_equal "*~*~*~* #{player2.name} has won the game! *~*~*~*", game.display_winner
  end
end
