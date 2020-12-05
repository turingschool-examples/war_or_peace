require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/card_generator'
require './lib/game'
require 'pry'

class GameTest < MiniTest::Test
  def test_it_exists
    card_generator = CardGenerator.new("cards.txt")
    card_generator.create_cards
    card_generator.create_decks
    player1 = Player.new("Jenny", card_generator.deck1)
    player2 = Player.new("Marisa", card_generator.deck2)
    game = Game.new(player1, player2)

    assert_instance_of Game, game
  end

  def test_get_wrong_answer_from_user
    card_generator = CardGenerator.new("cards.txt")
    card_generator.create_cards
    card_generator.create_decks
    player1 = Player.new("Jenny", card_generator.deck1)
    player2 = Player.new("Marisa", card_generator.deck2)
    game = Game.new(player1, player2)
    output = false
    assert_equal output, game.get_answer("no")
  end

  def test_get_right_answer_from_user
    card_generator = CardGenerator.new("cards.txt")
    card_generator.create_cards
    card_generator.create_decks
    player1 = Player.new("Jenny", card_generator.deck1)
    player2 = Player.new("Marisa", card_generator.deck2)
    game = Game.new(player1, player2)

    output = true
    assert_equal output, game.get_answer("go")
  end

  def test_take_turn
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player1 = Player.new("Jenny", deck)

    card4 = Card.new(:diamond, '10', 10)
    card5 = Card.new(:spade, '5', 5)
    card6 = Card.new(:heart, 'King', 13)
    cards2 =[card4, card5, card6]
    deck2 = Deck.new(cards2)
    player2 = Player.new("Marisa", deck2)
    turn = Turn.new(@layer1, player2)
    game = Game.new(player1, player2)

    game.take_turn
    award_array = [card2, card3, card1, card4]
    assert_equal award_array, game.player1.deck.cards
    assert_equal [card5, card6], game.player2.deck.cards
  end

  def test_game_over
    card_generator = CardGenerator.new("cards.txt")
    card_generator.create_cards
    card_generator.create_decks
    deck = Deck.new([])
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck2 = Deck.new(cards)
    player1 = Player.new("Jenny", deck)
    player2 = Player.new("Marisa", deck2)
    game = Game.new(player1, player2)
    game.start_game

    assert_equal true, game.game_over

  end
end
