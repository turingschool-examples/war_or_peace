require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    deck = CardGenerator.new("cards.txt").cards
    game = Game.new(deck)
    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    deck = CardGenerator.new("cards.txt")
    game = Game.new(deck)

    assert_instance_of CardGenerator, game.deck
    assert_equal [], game.turns
  end

  def test_add_turn
    deck = CardGenerator.new("cards.txt").cards
    game = Game.new(deck)
    game.create_two_players("Angel", "Chris")
    game.add_turn

    assert_equal 1, game.turns.length

    game.add_turn
    assert_equal 2, game.turns.length
  end

  def test_create_first_deck
    deck = CardGenerator.new("cards.txt").cards
    game = Game.new(deck)
    shuffled_deck = deck.shuffle

    assert_instance_of Deck, game.create_first_deck(shuffled_deck[0..25])
  end

  def test_create_second_deck
    deck = CardGenerator.new("cards.txt").cards
    game = Game.new(deck)
    shuffled_deck = deck.shuffle

    assert_instance_of Deck, game.create_second_deck(shuffled_deck[26..52])
  end

  def test_create_first_player
    deck = CardGenerator.new("cards.txt").cards
    game = Game.new(deck)
    shuffled_deck = deck.shuffle
    deck = game.create_first_deck(shuffled_deck[0..25])

    assert_instance_of Player, game.create_first_player("Angel", deck)
    assert_equal "Angel", game.create_second_player("Angel", deck).name
    assert_instance_of Deck, game.create_second_player("Angel", deck).deck
  end

  def test_create_second_player
    deck = CardGenerator.new("cards.txt").cards
    game = Game.new(deck)
    shuffled_deck = deck.shuffle
    deck = game.create_first_deck(shuffled_deck[26..52])

    assert_instance_of Player, game.create_second_player("Amber", deck)
    assert_equal "Amber", game.create_second_player("Amber", deck).name
    assert_instance_of Deck, game.create_second_player("Amber", deck).deck
  end

  def test_game_over
    deck = CardGenerator.new("cards.txt").cards
    game = Game.new(deck)
    shuffled_deck = deck.shuffle
    deck1 = game.create_first_deck(shuffled_deck[0..25])
    deck2 = game.create_second_deck(shuffled_deck[26..52])
    player1 = game.create_first_player("Angel", deck1)
    player2 = game.create_second_player("Amber", deck2)

    assert_equal false, game.game_over?

    24.times do
      deck1.remove_card
    end

    assert_equal true, game.game_over?
  end

  def test_display_winner
    deck = CardGenerator.new("cards.txt").cards
    game = Game.new(deck)
    shuffled_deck = deck.shuffle
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
