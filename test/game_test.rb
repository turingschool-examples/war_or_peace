require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    assert_equal player1, game.player1
    assert_instance_of Player, game.player1
    assert_equal player2, game.player2
    assert_instance_of Player, game.player2
    assert_equal 1, game.turn_count
  end

  def test_it_can_display_basic_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    turn = Turn.new(player1, player2)
    turn_winner = turn.winner
    turn_type = turn.type

    turn.pile_cards
    turn.award_spoils(turn_winner)

    assert_equal "Turn 1: Megan has won 2 cards", game.display_turn_result(turn, turn_winner, turn_type)
  end

  def test_it_can_display_war_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    turn = Turn.new(player1, player2)
    turn_winner = turn.winner
    turn_type = turn.type

    turn.pile_cards
    turn.award_spoils(turn_winner)

    assert_equal "Turn 1: WAR - Aurora has won 6 cards", game.display_turn_result(turn, turn_winner, turn_type)
  end

  def test_it_can_display_MAD_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    turn = Turn.new(player1, player2)
    turn_winner = turn.winner
    turn_type = turn.type

    turn.pile_cards
    turn.award_spoils(turn_winner)

    assert_equal "Turn 1: *mutually assured destruction* - 6 cards removed from play", game.display_turn_result(turn, turn_winner, turn_type)
  end

  def test_it_can_display_game_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)

    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card4, card3, card6])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    turn = Turn.new(player1, player2)
    turn_winner = turn.winner

    turn.pile_cards
    turn.award_spoils(turn_winner)

    assert player1.has_lost?
    refute player2.has_lost?
    assert_equal "*~*~*~* Aurora has won the game! *~*~*~*", game.display_game_result
  end

  def test_it_can_display_game_draw
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = Game.new(player1, player2)

    turn = Turn.new(player1, player2)
    turn_winner = turn.winner

    turn.pile_cards
    turn.award_spoils(turn_winner)

    refute player1.has_lost?
    refute player2.has_lost?
    assert_equal "---- DRAW ----", game.display_game_result
  end
end
