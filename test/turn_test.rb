require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn1 = Turn.new(player1, player2)

    assert_instance_of Turn, turn1
  end

  def test_it_has_players
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn1 = Turn.new(player1, player2)

    assert_equal "Caroline", turn1.player1.name

    assert_equal "Lucie", turn1.player2.name
  end

  def test_players_can_win_something
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn1 = Turn.new(player1, player2)

    assert_equal [], turn1.spoils_of_war
  end

  def test_turn_types

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
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn = Turn.new(player1, player2)

    assert_equal ":basic", turn.type

    turn.player2.deck.remove_card

    assert_equal ":war", turn.type
  end

  def test_winner

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
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn = Turn.new(player1, player2)

    turn.type

    assert_equal "player1", turn.winner

  end

  def test_pile_cards

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
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.pile_cards

    assert_equal [card1, card3], turn.spoils_of_war

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card4, card3, card6])
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.pile_cards

    assert_equal [card1, card2, card5, card4, card3, card6], turn.spoils_of_war

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card4, card3, card6])
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.pile_cards

    assert_equal [], turn.spoils_of_war

  end

  def test_spoils_awarded

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
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn = Turn.new(player1, player2)

    turn.type
    turn.winner
    turn.pile_cards
    turn.award_spoils

    assert_equal 5, turn.player1.deck.cards.count
  end

  def test_it_can_generate_cards

    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Caroline", deck1)
    player2 = Player.new("Lucie", deck2)
    turn = Turn.new(player1, player2)

    turn.generate_cards

    assert_equal 26, turn.player1.deck.cards.count
    assert_equal 26, turn.player1.deck.cards.count
  end
end
